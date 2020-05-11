cwlVersion: v1.0
class: CommandLineTool
inputs:
  files: File[]
outputs:
  out:
    type: stdout
stdout: output.txt
baseCommand: [sh, script.sh]
requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: script.sh
        entry: |-
          set -e
          ls -al 
      - $(inputs.files)
