# The script in the valueFrom field creates a bash list by concatenating
# the file paths in quotes with spaces inbetween.

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
        file_array=(${
          var cmd = "";
          for( var i = 0; i < inputs.files.length; i++) {
             cmd += "\"" + inputs.files[i].path + "\" ";
          }
          return cmd;
        });

        for ((i=0; i < \${#file_array[@]}; i++))
        do
         echo \${file_array[\$i]};
        done