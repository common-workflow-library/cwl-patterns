CWL patterns
------------

_Some patterns commonly encountered when writing CWL workflows_

<!-- TOC -->

- [Manifest file via Javascript](#manifest-file-via-javascript)
- [Embedding scripts](#embedding-scripts)
  - [I have `$` signs in my script :(](#i-have--signs-in-my-script-)
  - [I don't want to escape the `$`](#i-dont-want-to-escape-the-)
- [Embedding a bash script (style 2)](#embedding-a-bash-script-style-2)
- [Manipulating a list of files using expressions](#manipulating-a-list-of-files-using-expressions)

<!-- /TOC -->

## Manifest file via Javascript
> My tool takes in a list of filenames as input. I used to pass each file name
> on the command line, but when I scale up I run into unix  "Argument list too
> long"  errors. What can I do?

If the program accepts, or can be altered to accept, a manifest file containing
a list of input file paths, the CWL can be written to generate this manifest
file on the fly before invoking the tool ([example](manifest.cwl)).


## Embedding scripts
> I have a Python script that I want to embed in my tool wrapper (not make part
> of the docker image). How would I do this?

You can embed the script as an `InitialWorkDirRequirement`
([example](embed.cwl)).

### I have `$` signs in my script :(
> My embedded (Bash/Python/R) script has "$" signs in it and this is conflicting
> with CWL parameter references. How do get them to play nicely together?

You can escape the `$` in your script with `\$`

### I don't want to escape the `$`
> I'd rather just paste the script into the CWL and not have to go through it, 
> escaping the "$" signs. Do I have another option?

You could embed your script in the "contents" field of the default value of a
file. To note in this solution is that a user can supply a different file to the
script input and override the default script. This can be considered a bug or a
feature, depending on your use case ([example](embed2.cwl)). 

## Embedding a bash script (style 2)

A bash script can be passed as a string via the command line and invoked from
the command line.  ([example](list-of-files-bash.cwl)).

## Manipulating a list of files using expressions
> I have an input that is a list of files. I wish to do processing based on the
> file paths. 

This depends a bit on what the expression is intended to do. The easiest is if
the whole processing can be done in javascript. In this case the pattern looks
like

```
${
  var cmd = "";
  for( var i = 0; i < inputs.files.length; i++) {
     cmd += "\n echo " + inputs.files[i].path;
  }
  return cmd;  
}
```
([example](list-of-files-1.cwl))

This works well for when we can do with a JSON or simple string return value
from the JS code. If what we really want is an embedded script (say a bash or
Python script) to be generated, say via the `InitialWorkDirRequirement` it
becomes cumbersome to write in this fashion. One way of doing this is to write a
succinct JS expression that converts the passed JSON object into a list of paths
in the syntax accepted by the script. 

Here is an example for [Python](list-of-files-python.cwl) and for
[bash](list-of-files-bash.cwl)
