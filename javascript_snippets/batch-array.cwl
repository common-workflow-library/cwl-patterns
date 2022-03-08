cwlVersion: v1.2
class: ExpressionTool
doc: "Divide an array of 'Any' type into batches with a given batch size."
requirements:
  InlineJavascriptRequirement: {}
inputs:
  arr:
    type:
      type: array
      items: Any
  batchsize:
    type: int
outputs:
  batches:
    type:
      type: array
      items:
        type: array
        items: Any
expression: |
  ${
    var batches = [];
    for (var i = 0; i < inputs.arr.length; i+=inputs.batchsize) {
      var batch = inputs.arr.slice(i, i+inputs.batchsize);
      batches.push(batch);
    }
    return {"batches": batches};
  }
