
# WPI's [Workflow Control Patterns](http://www.workflowpatterns.com/patterns/control/) and CWL

Note: CWL is a data-driven (dataflow) workflow standard. These patterns use control-flow language and thus we speak of the equivalent data-flow constructs.
There is no concept of "thread of control" in CWL.

Of the 43 WPI Workflow Control patterns, 8 patterns are supported by CWL v1.2 or earlier and 35 patterns are unsupported.

[Back to the list of WPI pattern categories](../README.md)

## "Basic Control Flow Patterns"

* <a href="http://www.workflowpatterns.com/patterns/control/basic/wcp1.php">Pattern 1 (Sequence)</a>

Yes. CWL is a DAG based workflow language with explicit dependencies between steps.

CWL versions: all

* <a href="http://www.workflowpatterns.com/patterns/control/basic/wcp2.php">Pattern 2 (Parallel Split)</a>

Yes. Anytime a step in a CWL workflow has all of its inputs available it is allowed to be executed.

CWL versions: all

* <a href="http://www.workflowpatterns.com/patterns/control/basic/wcp3.php">Pattern 3 (Synchronization)</a>

Yes. One can have a step in a CWL workflow that requires inputs from the result of multiple other steps.
Downstream steps that require the output of that step (and their descendents) will not be available for execution until the combination step has finished.

CWL versions: all

* <a href="http://www.workflowpatterns.com/patterns/control/basic/wcp4.php">Pattern 4 (Exclusive choice)</a>

Yes. No explicit construct, but can be achieved by marking the two downstream steps with the `when` CWL conditional step
execution feature where the logic for one step's `when` field is the inverse of the other step's `when` field.

If there is a downstream workflow step that would inherit an value from one of the exclusive choice steps into the same incoming input port, then `pickValue: the_only_non_null` may be helpful to ensure that both "exclusive" choices didn't execute due to a misconfiguration in their `when` logics.

CWL versions: v1.2+

* <a href="http://www.workflowpatterns.com/patterns/control/basic/wcp5.php">Pattern 5 (Simple Merge)</a>

Yes. Any workflow can include another workflow as a step, thus allowing re-use.

CWL versions: all

## "Advanced Branching and Synchronization Patterns"

* <a href="http://www.workflowpatterns.com/patterns/control/advanced_branching/wcp6.php">Pattern 6 (Multi-Choice)</a>

No, as there is not a construct in CWL to implement this directly, as required by the WPI definition of this pattern.
Can be emulated using the CWL v1.2 `when` similar to the method to implement Pattern 4 (Exclusive choice), but with 3 or more steps using matched `when` markers

* <a href="http://www.workflowpatterns.com/patterns/control/advanced_branching/wcp7.php">Pattern 7 (Structured Synchronizing Merge)</a>

No, as there is not a construct in CWL to implement this directly, as required by the WPI definition of this pattern.
One way to achieve this is to hide the choice inside a sub-workflow which will provide a stable set of outputs to connect to other steps.
As this pattern implies the conditional execution of prior steps, the use of the `pickValue` construct in the merge step will likely be useful.

* <a href="http://www.workflowpatterns.com/patterns/control/advanced_branching/wcp8.php">Pattern 8 (Multi-Merge)</a>

No, as CWL does not have a construct for the WPI Multi-Choice pattern, which is a pre-requisite for the WPI definition of the Multi-Merge pattern.

However, any CWL step can rely on inputs from multiple other steps. This functionality is available in all CWL versions.

* <a href="http://www.workflowpatterns.com/patterns/control/advanced_branching/wcp9.php">Pattern 9 (Structured Discriminator)</a>

No. CWL does not support canceling the execution of tasks according to some criteria.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp28.php">Pattern 28 (Blocking Discriminator)</a>

No. State in CWL is read-only, therefore this pattern is not supported as it would be impossible to reset the discriminator.
This pattern is likely not possible in CWL for other reasons as well.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp29.php">Pattern 29 (Cancelling Discriminator)</a>

No. CWL does not support canceling the execution of tasks according to some criteria.
Additionally, all variables in CWL are read-only so there is no ability to "reset [a] construct".

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp30.php">Pattern 30 (Structured Partial Join)</a>

No. CWL does not support canceling the execution of tasks according to some dynamic criteria.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp31.php">Pattern 31 (Blocking Partial Join)</a>

No. CWL does not support re-ordering of tasks.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp32.php">Pattern 32 (Cancelling Partial Join)</a>

No. CWL does not support canceling the execution of tasks according to some criteria.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp33.php">Pattern 33 (Generalized AND-Join)</a>

No. CWL is a dataflow workflow language, not a control-flow workflow language. All inputs must be known at the time of workflow enactment.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp37.php">Pattern 37 (Local Synchronizing Merge)</a>

No. CWL is a dataflow workflow language, not a control-flow workflow language.

A CWL step can not accumulate inputs (or continue to emit outputs) over time.
CWL steps are only executed once (unless `scatter` is used) and the results of that step are only made available once execution has finished.

See also the evaluation of CWL against Pattern 7 (Structured Synchronizing Merge).

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp38.php">Pattern 38 (General Synchronizing Merge)</a>

Yes, as this was easy to implement due to two factors related to CWL being a dataflow workflow language and not a control-flow workflow language:

1. CWL steps are only executed once (unless `scatter` is used) and the results of that step are only made available once execution has finished.

2. A CWL step is available for execution when all of the upstream steps have been executed (or permanently skipped due to the use of the `when` construct).

CWL versions:
  without conditional steps: all
  with contional steps: v1.2+ 

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp41.php">Pattern 41 (Thread Merge)</a>

No, CWL has no concept of threads at the workflow language level. The underlying applications may use POSIX threads, but that is not managed by CWL.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp42.php">Pattern 42 (Thread Split)</a>

No, CWL has no concept of threads at the workflow language level. The underlying applications may use POSIX threads, but that is not managed by CWL.

## "Multiple Instance Patterns"

* <a href="http://www.workflowpatterns.com/patterns/control/multiple_instance/wcp12.php">Pattern 12 (Multiple Instances without Synchronization)</a>

No. While CWL has the `scatter` construct, using this implies an implicit "gather"ing of the results before downstreams steps can use the results.
This means that execution of subsequent steps is delayed for the slowest execution of the the `scatter`ed tasks, even if that particular result isn't needed right away.

Additionally, CWL does not have a `loop` construct, which would be another way one could implement this pattern.

* <a href="http://www.workflowpatterns.com/patterns/control/multiple_instance/wcp13.php">Pattern 13 (Multiple Instances with a priori Design-Time Knowledge)</a>

No. There is no CWL construct to execute a step or task a specific N number of times, where N is a concrete number (like 23) specified by the workflow author.

Additionally, CWL does not have a `loop` construct, which would be another way one could implement this pattern.

However: this pattern could be emulated in a CWL editor or language that converts to CWL syntax by creating explicit steps (23 in our example) in the CWL workflow description.

* <a href="http://www.workflowpatterns.com/patterns/control/multiple_instance/wcp14.php">Pattern 14 (Multiple Instances with a priori Run-Time Knowledge)</a>

Yes. CWL has the `scatter` construct which allows a compact directive that a given step is to be executed multiple times where most inputs are fixed except for those `scatter`ed specified inputs.

* <a href="http://www.workflowpatterns.com/patterns/control/multiple_instance/wcp15.php">Pattern 15 (Multiple Instances without a priori Run-Time Knowledge)</a>

No. CWL lacks any construct that can spawn additional tasks dynamically according to criteria.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp34.php">Pattern 34 (Static Partial Join for Multiple Instances)</a>

No. CWL does not have the ability to allow execution of a downstream step when N of M tasks have completed.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp35.php">Pattern 35 (Cancelling Partial Join for Multiple Instances)</a>

No. CWL does not support canceling the execution of tasks according to some criteria.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp36.php">Pattern 36 (Dynamic Partial Join for Multiple Instances)</a>

No. CWL lacks any construct that can spawn additional tasks dynamically according to criteria.

## "State-based Patterns"

* <a href="http://www.workflowpatterns.com/patterns/control/state/wcp16.php">Pattern 16 (Deferred Choice)</a>

No. The CWL v1.2+ conditional workflow step ability is only based upon explict inputs to the workflow step.

Additionally, in CWL there is no concept of an "operating environment".

* <a href="http://www.workflowpatterns.com/patterns/control/state/wcp17.php">Pattern 17 (Interleaved Parallel Routing)</a>

No. Ordering of tasks in CWL is not fixed, but the dependecy graph is explicit.

There is no CWl construct to limit the number of parallel tasks being executed, that is up to the workflow engine.

* <a href="http://www.workflowpatterns.com/patterns/control/state/wcp18.php">Pattern 18 (Milestone)</a>

No. In CWL, parameter values are read-only; they can not change over time.

It is not possible to query the state of another CWL task.

A step in a CWL workflow can only recieve specific outputs from other steps that have already completed, and this wiring is fixed prior to workflow execution.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp39.php">Pattern 39 (Critical Section)</a>

No. Sub sections of CWL workflows can not be bidirectionally connected. One could depend on another (by putting the other in a sub-workflow, if it isn't one already).

It is not possible to query the state of another CWL task.

A step in a CWL workflow can only recieve specific outputs from other steps that have already completed, and this wiring is fixed prior to workflow execution.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp40.php">Pattern 40 (Interleaved Routing)</a>

No. Ordering of tasks in CWL is not fixed, but the dependecy graph is explicit.

There is no CWl construct to limit the number of parallel tasks being executed, that is up to the workflow engine.

## "Cancellation and Force Completion Patterns"

* <a href="http://www.workflowpatterns.com/patterns/control/cancellation/wcp19.php">Pattern 19 (Cancel Task)</a>

No. CWL does not support canceling the execution of tasks according to some criteria.

* <a href="http://www.workflowpatterns.com/patterns/control/cancellation/wcp20.php">Pattern 20 (Cancel Case)</a>

No. CWL does not support canceling the execution of tasks according to some criteria.

Additionally, CWL does not have the concept of a "case".

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp25.php">Pattern 25 (Cancel Region)</a>

No. CWL does not support canceling the execution of tasks according to some criteria.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp26.php">Pattern 26 (Cancel Multiple Instance Task)</a>

No. CWL does not support canceling the execution of tasks according to some criteria.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp27.php">Pattern 27 (Complete Multiple Instance Task)</a>

No. CWL does not support canceling the execution of tasks according to some criteria.

## "Iteration Patterns"

* <a href="http://www.workflowpatterns.com/patterns/control/structural/wcp10.php">Pattern 10 (Arbitrary Cycles)</a>

No. CWL has no loop construct.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp21.php">Pattern 21 (Structured Loop)</a>

No. CWL has no loop construct.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp22.php">Pattern 22 (Recursion)</a>

No. CWL does not support recursion.

## "Termination Patterns"

* <a href="http://www.workflowpatterns.com/patterns/control/structural/wcp11.php">Pattern 11 (Implicit Termination)</a>

Yes. CWL workflows are finished when all of the required outputs are available.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp43.php">Pattern 43 (Explicit Termination)</a>

No. CWL does not have an explicit "end node" construct.

## "Trigger Patterns"

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp23.php">Pattern 23 (Transient Trigger)</a>

No. CWL does not support the concept of triggers or signals.

* <a href="http://www.workflowpatterns.com/patterns/control/new/wcp24.php">Pattern 24 (Persistent Trigger)</a>

No. CWL does not support the concept of triggers or signals.
