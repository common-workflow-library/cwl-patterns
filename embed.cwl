class: CommandLineTool
cwlVersion: v1.0

inputs:
  message: string

baseCommand: ["python", "myscript.py"]

requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: myscript.py
        entry: |-
          print("$(inputs.message)") 

outputs:
  example_out:
    type: stdout
stdout: output.txt