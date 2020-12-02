#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.0

requirements:
  InitialWorkDirRequirement:
    listing:
    - entryname: myscript.py
      entry:
        $include: myscript.py

inputs:
  message: string

outputs:
  example_out:
    type: stdout
stdout: output.txt

baseCommand:
- python
- myscript.py
