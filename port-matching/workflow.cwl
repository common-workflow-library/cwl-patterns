#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.0

inputs:
  in1: string?
  in2: string[]?

outputs:
  out1:
    type: string?
    outputSource: step1/out1
  out2:
    type: string[]?
    outputSource: step1/out2

steps:
  step1:
    in:
      in1: in2
      in2: in1
    run: tool.cwl
    out:
    - out1
    - out2
