#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.0

requirements:
    StepInputExpressionRequirement: {}
    InlineJavascriptRequirement: {}

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
      in1: 
        source: in2
        valueFrom: $(self[0])
      in2: 
        source: in1
        valueFrom: $([self])
    run: tool.cwl
    out:
    - out1
    - out2
