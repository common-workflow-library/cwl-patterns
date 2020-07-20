#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.0

inputs:
  in1: string?
  in2: string[]?

outputs:
  out1:
    type: string?
    outputBinding:
      outputEval: $(inputs.in1)
  out2:
    type: string[]?
    outputBinding:
      outputEval: $(inputs.in2)

baseCommand: [echo]
arguments: []
