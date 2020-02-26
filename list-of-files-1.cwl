cwlVersion: v1.0
class: CommandLineTool
requirements:
  ShellCommandRequirement: {}
  InlineJavascriptRequirement: {}
inputs:
  files:
    type:
      type: array
      items: File
outputs:
  example_out:
    type: stdout
stdout: output.txt
arguments:
    - shellQuote: false
      valueFrom: >
        ${
          var cmd = "";
          for( var i = 0; i < inputs.files.length; i++) {
             cmd += "\n echo " + inputs.files[i].path;
          }
          return cmd;
        }