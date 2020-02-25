# CWL patterns
_Some patterns commonly encountered when writing CWL workflows_


## Manifest file via Javascript
> My tool takes in a list of filenames as input. I used to pass each file name 
on the command line, but when I scale up I run into unix "Argument list too long" 
errors. What can I do?

If the program accepts, or can be altered to accept, a manifest file containing
a list of input file paths, the CWL can be written to generate this manifest file
on the fly before invoking the tool. [example][manifest.cwl]
