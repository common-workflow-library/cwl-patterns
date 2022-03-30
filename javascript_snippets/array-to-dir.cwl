cwlVersion: v1.2
class: ExpressionTool
doc: "Stage an array of 'File' and 'Directory' type (potentially mixed) in a 'Directory'."
requirements:
  InlineJavascriptRequirement: {}
inputs:
  arr:
    type:
      type: array
      items: [File, Directory]
  dirname:
    type: string
outputs:
  dir: Directory
expression: |
  ${
    var dir = {"class": "Directory",
               "basename": inputs.dirname,
               "listing": inputs.arr};
    return {"dir": dir};
  }
