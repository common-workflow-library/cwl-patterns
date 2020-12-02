#!/usr/bin/env cwl-runner
class: CommandLineTool
cwlVersion: v1.0
label: Run an embedded Python script

inputs:
  script:
    type: File
    default:
      class: File
      basename: script.py
      contents:
        $include: fixed-script.py
    inputBinding:
      position: 1

outputs:
  results:
    type: stdout
stdout: out.txt

baseCommand: python
