cwlVersion: v1.2
class: ExpressionTool
doc: "Process a directory of bgzipped and indexed vcf files into an array with indices as secondary files."
requirements:
  InlineJavascriptRequirement: {}
hints:
  LoadListingRequirement:
    loadListing: shallow_listing
inputs:
  vcfsdir: Directory
outputs:
  vcfs:
    type: File[]
    secondaryFiles: [.tbi]
expression: |
  ${
    var vcfs = [];
    for (var i = 0; i < inputs.vcfsdir.listing.length; i++) {
      var file = inputs.vcfsdir.listing[i];
      if (file.nameext == '.gz') {
        var main = file;
        for (var j = 0; j < inputs.vcfsdir.listing.length; j++) {
          var file = inputs.vcfsdir.listing[j];
          if (file.basename == main.basename+".tbi") {
            main.secondaryFiles = [file];
            break;
          }
        }
        vcfs.push(main);
      }
    }
    return {"vcfs": vcfs};
  }
