
# WPI's [Workflow Data Patterns](http://www.workflowpatterns.com/patterns/data/) and CWL

Of the 40 WPI Workflow Data patterns, 17 patterns are supported by CWL v1.2 or earlier and 23 patterns are unsupported.

[Back to the list of WPI pattern categories](../README.md)

* <a href="http://www.workflowpatterns.com/patterns/data/visibility/wdp1.php">Pattern 1 (Task Data)</a>

"Data can be explicitly declared at task level with task level scoping" -> Yes, you can have a variable or value defined in a CommandLineTool, ExpressionTool, or Operation that is not visible to other CWL Processes. They are initialized with a value provided by the Process author.

* <a href="http://www.workflowpatterns.com/patterns/data/visibility/wdp2.php">Pattern 2 (Block Data)</a>

"Data can be explicitly declared at block task level with block task level scoping" -> Yes, one can declare an extra variable at the step level or sub-workflow level.

"Facilities exist for formal parameter passing to and from a block" -> sub-Processes can inherit a step level variable when it is connected to one of the Process’s inputs. They cannot access any given step-level input by name or any other mechanism, only by its own defined input parameters. Arbitrary access to block level parameters from another block is not possible in CWL. The only outputs from a step are the outputs from the underlying Process that have been marked for export. For sub-workflows, their steps may connect workflow-level data (inputs parameters) to a specific sub-Processes by identifiers. The only data from a sub-workflow that is available to a sibling Process or the parent Workflow are the explicit output parameters that connect to specific step outputs in the sub-Workflow.

* <a href="http://www.workflowpatterns.com/patterns/data/visibility/wdp3.php">Pattern 3 (Scope Data)</a>

No. CWL does not support Scope Data as scopes are defined as not creating a new address space; the closest approximation (a CWL sub-Workflow) does create a new address space.

* <a href="http://www.workflowpatterns.com/patterns/data/visibility/wdp4.php">Pattern 4 (Multiple Instance Data)</a>

"The data element is capable of being replicated or partitioned across multiple tasks": Yes.

"Each of these data instances exist in their own address space": Yes.

A Process can be run with unique data inputs multiple times in a CWL workflow and multiple times in the same step when using the ‘scatter’ feature. Each run of that Process has access to only the specific data that was connected to it, and not to the data from other runs.

"The instances are able to be accessed from a higher level in the process hierarchy" Only after execution is finished, and only for the explicit output values, yes.

* <a href="http://www.workflowpatterns.com/patterns/data/visibility/wdp5.php">Pattern 5 (Case Data)</a>

"Direct tool support for data elements at case level with case level scoping. Case data visible to all components of the case.": No, in CWL each Process only has access to its own defined inputs. Those inputs might be connected to Workflow-scope inputs (or the outputs from other steps) but there is no “global” or case namespace accessible from all levels of a workflow.

* <a href="http://www.workflowpatterns.com/patterns/data/visibility/wdp6.php">Pattern 6 (Folder Data)</a>
No. As CWL does not have a Case Data concept, it can not have a Folder Data concept either.

* <a href="http://www.workflowpatterns.com/patterns/data/visibility/wdp7.php">Pattern 7 (Workflow Data)</a>

"Workflow data visible to all components of a workflow". Yes, all steps can reference workflow level inputs (including inputs with default values that are rarely overridden by users) in setting up the inputs to their Process. However, inside those Processes there is no visibility into the step level or workflow level namespaces. Only those data values that have been propagated to the Process via one of its own named inputs are available.

* <a href="http://www.workflowpatterns.com/patterns/data/visibility/wdp8.php">Pattern 8 (Environment Data)</a>

No. There is no CWL construct for Environment Data. If network access is allowed by the executor, then the applications executed by CommandLineTools can access external data, though this is not advised for repeatability and resiliency reasons. Other sources of data gathering besides IP network access by CommandLineTools are possible, but not guaranteed by the CWL standards. They would certainly not be portable and such are not recommended.

* <a href="http://www.workflowpatterns.com/patterns/data/internal/wdp9.php">Pattern 9 (Task to Task)</a>

Yes, CWL supports Task to Task data communication via Distinct data channels. That is, CWL Processes can inherit data from another Process and their outputs can in turn become inputs to other Processes, all defined by the `in` mapping in each CWL Workflow step. Concurrency is only an issue when `InplaceUpdateRequirement` is implemented.

* <a href="http://www.workflowpatterns.com/patterns/data/internal/wdp10.php">Pattern 10 (Block Task to Sub-Workflow Decomposition)</a>

"Data elements available to a block task are able to be passed to or are accessible in the associated sub-workflow". Yes, step level inputs are connected to sub-Workflows. 

"There is some degree of control over which elements at block task level are made accessible in the sub-workflow" Yes, only explicit step level values are connected to the pre-defined sub-workflow inputs.

* <a href="http://www.workflowpatterns.com/patterns/data/internal/wdp11.php">Pattern 11 (Sub-Workflow Decomposition to Block Task)</a>

"Data elements at sub-workflow level can be passed to or made accessible in the corresponding block task" Yes, via the ‘outputs’ section in the CWL (sub-)Workflow step definition.

* <a href="http://www.workflowpatterns.com/patterns/data/internal/wdp12.php">Pattern 12 (To Multiple Instance Task)</a>

"Multiple instance tasks directly supported". Yes.

"Data elements can be passed from an atomic task to all instances of a multiple instance task". Yes, via ‘scatter’.

"Workflow handles synchronization of data passing and any necessary data replication" Yes, this is a defined responsibility of a CWL compliant workflow engine

"Facilities are available to allocate sections of an aggregate data element to specific task instances". Yes.

"Data elements in each task instance are independent of those in other task instances". Yes

* <a href="http://www.workflowpatterns.com/patterns/data/internal/wdp13.php">Pattern 13 (From Multiple Instance Task)</a>

"Multiple instance tasks directly supported". Yes

"Data elements can be aggregated from multiple task instances and forwarded to subsequent task instance(s)" Yes, via an implicit gather after the execution of a CWL Workflow step marked with “scatter”.

"Workflow handles synchronization of data passing and any necessary data replication". Yes, this is a defined responsibility of a CWL compliant workflow engine

* <a href="http://www.workflowpatterns.com/patterns/data/internal/wdp14.php">Pattern 14 (Case to Case)</a>

No, CWL explicitly and purposefully does not support interactions between concurrently executed Processes. CWL is not a service orchestration language. There is no CWL construct to say that two or more Processes should execute simultaneously or be overlapping. The software run by CommandLineTool processes might communicate data with an external service that might allow for exchanging data between CommandLineTool Processes that might be coincidentally executing concurrently. However, this is highly not recommended nor it is portable. There is a proposal (NOTE:  https://github.com/common-workflow-language/cwltool#running-mpi-based-tools-that-need-to-be-launched) for an addition to a future version of the CWL standards of a "MPIRequirement’ that is available via a special flag in the CWL reference runner that achieves a similar functionality for a single CommandLineTool that should be executed on many nodes concurrently with intra-node communication set up by a system compliant with the MPI standard.

* <a href="http://www.workflowpatterns.com/patterns/data/external/wdp15.php">Pattern 15 (Task to Environment - Push)</a>, <a href="http://www.workflowpatterns.com/patterns/data/external/wdp16.php">Pattern 16 (Environment to Task - Pull)</a>, <a href="http://www.workflowpatterns.com/patterns/data/external/wdp19.php">Pattern 19 (Case to Environment - Push)</a>, <a href="http://www.workflowpatterns.com/patterns/data/external/wdp20.php">Pattern 20 (Environment to Case - Pull)</a>, <a href="http://www.workflowpatterns.com/patterns/data/external/wdp23.php">Pattern 23 (Workflow to Environment - Push)</a>, <a href="http://www.workflowpatterns.com/patterns/data/external/wdp24.php">Pattern 24 (Environment to Workflow - Pull)</a>

No. This is not a feature of CWL. A CommandLineTool Process could communicate with an external service or resource via IP networking, but this is not explicitly supported by CWL and is not recommended. Interactions with stateful services are features of other workflow languages, like the now-defunct (NOTE:  https://lists.apache.org/thread.html/r19322d54fd6aae5778aff46717dea2fbd37c3b64571300ad9cee0191%40%3Cdev.taverna.apache.org%3E
) Taverna, but they entail significant complexity and implementation costs to handle error states and other common challenges.

* <a href="http://www.workflowpatterns.com/patterns/data/external/wdp17.php">Pattern 17 (Environment to Task - Push)</a>, <a href="http://www.workflowpatterns.com/patterns/data/external/wdp18.php">Pattern 18 (Task to Environment - Pull)</a>, <a href="http://www.workflowpatterns.com/patterns/data/external/wdp21.php">Pattern 21 (Environment to Case - Push)</a>, <a href="http://www.workflowpatterns.com/patterns/data/external/wdp22.php">Pattern 22 (Case to Environment - Pull)</a>, <a href="http://www.workflowpatterns.com/patterns/data/external/wdp25.php">Pattern 25 (Environment to Workflow - Push)</a>, <a href="http://www.workflowpatterns.com/patterns/data/external/wdp26.php">Pattern 26 (Workflow to Environment - Pull)</a>

No. While the "NetworkAccess" requirement enables a CommandLineTool to be marked as requiring network (IP) access the CWL standards state that “Enabling network access does not imply a publically routable IP address or the ability to accept inbound connections.”

* <a href="http://www.workflowpatterns.com/patterns/data/mechanisms/wdp27.php">Pattern 27 (Data Transfer by Value - Incoming)</a>

"Workflow components are able to accept data elements passed to them as value": Yes. The Processes connected to each step in a CWL workflow receive data by value to each of their required input parameters and zero or more of their optional input parameters.

* <a href="http://www.workflowpatterns.com/patterns/data/mechanisms/wdp28.php">Pattern 28 (Data Transfer by Value - Outgoing)</a>

"Workflow components are able to pass data elements to subsequent components by value": Yes, the results from a CWL Process are available as named outputs for connecting to the inputs of other Processes (and as final Workflow outputs).

* <a href="http://www.workflowpatterns.com/patterns/data/mechanisms/wdp29.php">Pattern 29 (Data Transfer - Copy In/Copy Out)</a>

No. In CWL we do not overwrite prior data except when the optional ‘InplaceUpdateRequirement’ is used. Even then there isn’t a copy, the specified Files and Directories are directly modified by the CommandLineTool.

* <a href="http://www.workflowpatterns.com/patterns/data/mechanisms/wdp30.php">Pattern 30 (Data Transfer by Reference - Unlocked)</a>, <a href="http://www.workflowpatterns.com/patterns/data/mechanisms/wdp31.php">Pattern 31 (Data Transfer by Reference - With Lock)</a>

No. While the CWL object model does use IRIs/URIs ‘locations’ to identify specific File and Directories, those underlying bitstreams are invariant unless ‘InplaceUpdateRequirement’ is used. Those ‘locations’ are transformed to local file paths just prior to CommandLineTool execution.

* <a href="http://www.workflowpatterns.com/patterns/data/mechanisms/wdp32.php">Pattern 32 (Data Transformation - Input)</a>

Yes. There are many opportunities to transform data in CWL. In CWL Workflow step definitions once can extract a subset or perform another transformation using the ‘valueFrom’ field and a CWL expression or CWL parameter reference.

* <a href="http://www.workflowpatterns.com/patterns/data/mechanisms/wdp33.php">Pattern 33 (Data Transformation - Output)</a>

No. As a workaround, another Process (ExpressionTool, CommandLineTool, or sub-Workflow) can be used to modify an output before further use. Within a CommandLineTool Process the ‘outputEval’ field can do modifications.

* <a href="http://www.workflowpatterns.com/patterns/data/routing/wdp34.php">Pattern 34 (Task Precondition - Data Existence)</a>

"Direct precondition support for evaluation data element existence at task instance level“: Yes. This is the basis for task dependency in CWL.

* <a href="http://www.workflowpatterns.com/patterns/data/routing/wdp35.php">Pattern 35 (Task Precondition - Data Value)</a>

No. Once a Process has completed then all of its named outputs are available to sibling Workflow steps. While these can be evaluated using the new `when` field, this only decides if execution can take place. It does not delay execution as there is no capacity to update the inputs later; only to make new inputs under different steps.

* <a href="http://www.workflowpatterns.com/patterns/data/routing/wdp36.php">Pattern 36 (Task Postcondition - Data Existence)</a>, <a href="http://www.workflowpatterns.com/patterns/data/routing/wdp37.php">Pattern 37 (Task Postcondition - Data Value)</a>

No. CommandLineTools and ExpressionTools terminate when their underlying tools finish execution. (sub-)Workflows terminate when all steps required for the outputs have finished. While the outputs can be examined in a CWL Expression and an exception thrown if they do not meet the given requirements, this does not cause continued execution or re-execution, but a permanent failure of the Process.

* <a href="http://www.workflowpatterns.com/patterns/data/routing/wdp38.php">Pattern 38 (Event-Based Task Trigger)</a> , <a href="http://www.workflowpatterns.com/patterns/data/routing/wdp39.php">Pattern 39 (Data-Based Task Trigger)</a>

No, this is not part of the CWL standards. But another system could initiate the execution of a CWL Process based upon an event outside the CWL Process description itself (or via an unofficial extension to the CWL standards).

* <a href="http://www.workflowpatterns.com/patterns/data/routing/wdp40.php">Pattern 40 (Data-Based Routing)</a>

* "Any data element accessible at case level can be utilised in a routing construct". Any output from a sibling CWL step can be used to decide if a CWL step should be executed, yes.
“Direct workflow support”: Yes, using the “when” field in a CWL workflow step definition.

"Support for both exclusive choice and multi-choice constructs" These can be emulated, but not directly enforced.

