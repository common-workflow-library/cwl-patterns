# The javascript expression returns a string that is code for a python list

cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
      - entryname: script.py
        entry: |-
          # The javascript expression returns a string that is code for
          # a python list
          file_array=[ ${
            var l = "";
            for( var i = 0; i < inputs.files.length; i++) {
              if (i > 0) { l += ", "; }
              l += "'" + inputs.files[i].path + "'";
            }
            return l;
          }]

          print(file_array)

inputs:
  files:
    type:
      type: array
      items: File
outputs:
  example_out:
    type: stdout
stdout: output.txt
baseCommand: ["python", "script.py"]
