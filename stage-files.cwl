cwlVersion: v1.0
class: CommandLineTool
inputs:
  files: File[]
outputs:
  out:
    type: stdout
stdout: output.txt
baseCommand: ["ls", "-al"]
requirements:
  InitialWorkDirRequirement:
    listing: $(inputs.files)
