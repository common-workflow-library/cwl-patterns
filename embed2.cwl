#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool
label: Run an embedded Python script
hints:
  DockerRequirement:
    dockerPull: python:3
baseCommand: python

inputs: 
  script: 
    type: File
    inputBinding:
      position: 1
    default:
        class: File
        basename: "script.py"
        contents: |-
          cash = 256.75
          print("This costs ${}".format(cash))

outputs:
  results:
    type: stdout