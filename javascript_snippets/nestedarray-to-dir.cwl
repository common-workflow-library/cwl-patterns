cwlVersion: v1.2
class: ExpressionTool
doc: "Stage a nested array of 'File' and 'Directory' type (potentially mixed) in a 'Directory'."
requirements:
  InlineJavascriptRequirement: {}
inputs:
  nestedarr:
    type:
      type: array
      items:
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
               "listing": []};
    for (var i = 0; i < inputs.nestedarr.length; i++) {
      for (var j = 0; j < inputs.nestedarr[i].length; j++) {
        dir.listing.push(inputs.nestedarr[i][j]);
      }
    }
    return {"dir": dir};
  }
