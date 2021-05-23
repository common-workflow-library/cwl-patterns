
# WPI's [Workflow Presentation Patterns](http://www.workflowpatterns.com/patterns/presentation/) and CWL

Of the N WPI Workflow Presentation patterns, X patterns are supported by CWL v1.2 or earlier and Y patterns are unsupported.

Note, as CWL specificaltion does not have any graphical notation, the Concrete Syntax Patterns will highly depend on the platform responsible for rendering the visual representation of the workflow.

[Back to the list of WPI pattern categories](../README.md)
## Abstract Syntax Patterns

The abstract syntax of a process model relates to the formal structure of process elements and the relationships among them.

![](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/images/fig2.jpg)

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

  *The pattern captures features to decompose a process model along the crosscutting concerns of the modeling domain, which are scattered across several model elements or modules.*

  **Yes**. If necessary, a group of steps that belong to a certain modeling domain can be put into a subworkflow and reused multiple times within the same main workflow. As an example, all the steps related to QC analysis of genomic data can be placed into a separate subworkflow.

* [Pattern 7 (Composition)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm7.php)

  *The pattern describes features for constructing a consolidated process model from different disjoint modules, thus possibly reversing the effects of modularization.*

  **Yes**. Any subworkflow can be replaced by a set of command line tools and other subworkflows it consists of. The logic of the main pipeline will remain the same.

* [Pattern 8 (Merging)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm8.php)

  *The pattern describes features for merging similar process models based on their commonalities, i.e. their identical model elements.*

  **Yes**. Workflows of the same or similar functionality can be merged into a single more complex pipeline. For additional functionality extra inputs can be added.

* [Pattern 9 (Omission)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm9.php)

  *The pattern captures features to remove one or more elements from a process model and reconnect the remaining ones. It implies information lost.*

  **Yes**. Unused tasks can be removed from the workflow as long as all broken connections between the remaining tasks are restored.

* [Pattern 10 (Collapse)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm10.php)

  *The pattern describes features to synthesize multiple model elements into a single one of more abstract nature, where the distinction among the constituent elements is no longer relevant. It implies information synthesis.*

  **Yes**. Workflow steps can be grouped together and put into a separate subworkflow, thus making the process model more abstract and more understandable.

* [Pattern 11 (Restriction)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm11.php)

  *The pattern captures features to restrict the syntax and semantics of a process modeling language, by removing modeling concepts from the language's meta-model or restricting the existing ones.*

  **Yes**. Certain syntax, semantic and functional restrictions can be applied when omitting 
  `SubworkflowFeatureRequirement`, `ScatterFeatureRequirement`, `MultipleInputFeatureRequirement`, `StepInputExpressionRequirement`, `InplaceUpdateRequirement`, `InlineJavascriptRequirement`, `SchemaDefRequirement`, etc.

* [Pattern 12 (Extension)](http://www.workflowpatterns.com/patterns/presentation/abstractsyntax/asm12.php)

  *The pattern captures features to extend the syntax and the semantics of a process modeling language, by adding new modeling concepts to the language's meta-model, or refining the existing ones*

  **Yes**. Implementation extensions not required for correct execution and metadata may be provided as additional fields on any object. Such extensions fields must use a namespace prefix listed in the workflow's `$namespaces` section.
## Concrete Syntax Patterns
The concrete syntax of a process models deals with its visual appearance including symbols, colors and positions.

![](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/images/Fig01.jpg)

* [Pattern 1 (Layout Guidance)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm1.php)

  *The pattern refers to the availability of layout conventions or advice to organize the various model elements on a canvas.*

  **Yes**. CWL allows to provide additional metadata for any object. As an example, Seven Bridges platform extends the description of each model element with `sbg:x` and `sbg:y` fields to define the locations of the items on canvas.

* [Pattern 2 (Enclosure Highlight)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm2.php)

  *The pattern refers to the availability of modeling constructs to visually enclose a set of logically-related model elements.*

  **Yes**. CWL allows to provide additional metadata for any object. As an example, SciDAP platform extends the descriptions of workflow inputs and outputs with `sd:layout` and `sd:visualPlugins` fields to group logically-related model elements.

* [Pattern 3 (Graphical Highlight)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm3.php)

  *The pattern refers to the availability of features to change the visual appearance of model elements, such as shape, line thickness and type, background color, font type and color.*
  
  **Yes**. CWL allows to provide additional metadata for any object. That, if necessary, can be used to define visual appearence of the model elements.

* [Pattern 4 (Pictorial Annotation)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm4.php)

  *The pattern denotes the availability of features to assign pictorial elements, such as icons or images, to modeling elements.*

  **Yes**. CWL allows to provide additional metadata for any object. That, if necessary, can be used to assign pictorial elements, such as icons or images, to modeling elements.

* [Pattern 5 (Textual Annotation)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm5.php)

  *The pattern denotes the availability of features to visually represent free-form text in the canvas, which can be attached to modeling elements without changing semantics.*
 
  **Yes**. CWL allows to use human-readable labels and documentation strings set in the `label` and `doc` fields. In addition, any CWL object can be extended with the extra metadata fields.

* [Pattern 6 (Explicit Representation)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm6.php)

  *The pattern denotes the ability to capture process modeling concepts via a dedicated graphical notation.*

  **Yes**. CWL allows to provide additional metadata for any object. That, if necessary, can be used to capture and highlight process modeling concepts.

* [Pattern 7 (Alternative Representation)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm7.php)

  *The pattern denotes the ability to capture process modeling concepts without the use of their primary graphical notation.*

  **No**. Even if CWL allows to provide additional metadata for any object, it will be more like an *Explicit Representation* rather then *Alternative Representation*.

* [Pattern 8 (Naming Guidance)](http://www.workflowpatterns.com/patterns/presentation/concretesyntax/csm8.php)

  *The pattern refers to the availability of naming conventions or advice for model elements’ labels.*

  **No**. CWL supports any human-readable labels and documentation strings set in the `label` and `doc` fields of the model elements.