
# WPI's [Workflow Presentation Patterns](http://www.workflowpatterns.com/patterns/presentation/) and CWL

Of the N WPI Workflow Presentation patterns, X patterns are supported by CWL v1.2 or earlier and Y patterns are unsupported.

[Back to the list of WPI pattern categories](../README.md)
## Abstract Syntax Patterns

The abstract syntax of a process model relates to the formal structure of process elements and the relationships among them.

* [Pattern 1 (Block Structuring)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm1.php)

  *In a block-structured process model, each split element has a corresponding join element of the same type, and split-join pairs are properly nested.*
  
  **Yes**. A combination of `MultipleInputFeatureRequirement`, `StepInputExpressionRequirement`, and `InlineJavascriptRequirement` allows to implement proper split and join elements, thus creating a block-structured process model.

* [Pattern 2 (Duplication)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm2.php)

  *Introduces controlled redundancy in a process model by repeating model elements.*

  **Yes**. If necessary, a contolled redundancy can be achieved by having several steps that run exactly the same subworkflow or command line tool, but are connected to the different upstream tasks. Additionally, `$import` and `$include` CWL directives, as well as YAML anchors and references can be used.

* [Pattern 3 (Compacting)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm3.php)

  *The pattern refers to methods to remove redundant or superfluous elements in a process model. Thus, it may revert the effects of Duplication.*

  **Yes**. The redundant step can be easily removed from the workflow. If the remaining step needs to combine outputs from the several upstream tasks, `MultipleInputFeatureRequirement` and `InlineJavascriptRequirement` can be used.

* [Pattern 4 (Vertical Modularization)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm4.php)

  *The pattern captures features to decompose a model into vertical modules, i.e. subprocesses, according to a hierarchical structure.*

  **Yes**. CWL allows to reuse command line tools and subworkflows multiple times within the same main workflow.

* [Pattern 5 (Horizontal Modularization)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm5.php)

  *The pattern captures features to partition a process model into smaller and more easily manageable peer modules. Hence, to facilitate collaboration, and to foster reuse of modules within the same process model or across different process models.*
  
  **Yes**. CWL workflows and command line tools follow the principles of portability, interoperability, and reusability, thus can be reused within the same or multiple pipelines. Workflows and command line tools developed and maintained by different teams can be parts of the same pipeline.

* [Pattern 6 (Orthogonal Modularization)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm6.php)

* [Pattern 7 (Composition)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm7.php)

* [Pattern 8 (Merging)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm8.php)

* [Pattern 9 (Omission)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm9.php)

* [Pattern 10 (Collapse)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm10.php)

* [Pattern 11 (Restriction)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm11.php)

* [Pattern 12 (Extension)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm12.php)

## Concrete Syntax Patterns
The concrete syntax of a process models deals with its visual appearance including symbols, colors and positions.

* [Pattern 1 (Layout Guidance)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm1.php)

* [Pattern 2 (Enclosure Highlight)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm2.php)

* [Pattern 3 (Graphical Highlight)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm3.php)

* [Pattern 4 (Pictorial Annotation)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm4.php)

* [Pattern 5 (Textual Annotation)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm5.php)

* [Pattern 6 (Explicit Representation)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm6.php)

* [Pattern 7 (Alternative Representation)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm7.php)

* [Pattern 8 (Naming Guidance)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm8.php)