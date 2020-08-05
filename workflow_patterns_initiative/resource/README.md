# WPI's [Workflow Resource Patterns](http://www.workflowpatterns.com/patterns/resource/) and CWL

Note: Most of the WPI resource handling patterns concern the allocation of business
tasks to human resources.

The CWL standards define a language to describe batch computation tasks and
workflows made from these tasks. CWL purposely does not include non-computational
tasks. Distribution of tasks in CWL is up to the implementing workflow engine to
comply with any specified computational resource requirements (which are mandatory)
or hints (which are optional).

While only 2 of the 43 of the WPI Resource Patterns have an analogue in the
CWL standards, many of these other patterns are used by CWL compatible
workflow management systems; either controlled by algorithmic choices or
user/operator input.

[Back to the list of WPI pattern categories](../README.md)

## "Creation Patterns"

* [Pattern 1 (Direct Distribution)](http://www.workflowpatterns.com/patterns/resource/creation/wrp1.php)

  No. There is no concept of a (computational) resource identity in the CWL standards.
  There is no method to specify that a given task should be execution on a specific computer.

* [Pattern 2 (Role-Based Distribution)](http://www.workflowpatterns.com/patterns/resource/creation/wrp2.php)

  No.

* [Pattern 3 (Deferred Distribution)](http://www.workflowpatterns.com/patterns/resource/creation/wrp3.php)

  No. The choice of up front scheduling, deferred scheduling, or hybrid
  scheduling is not a concept in CWL. The CWL standards do not specify a
  scheduling modality nor do they forbid any scheduling modality.

* [Pattern 4 (Authorization)](http://www.workflowpatterns.com/patterns/resource/creation/wrp4.php)

  No.

* [Pattern 5 (Separation of Duties)](http://www.workflowpatterns.com/patterns/resource/creation/wrp5.php)

  No.

* [Pattern 6 (Case Handling)](http://www.workflowpatterns.com/patterns/resource/creation/wrp6.php)

  No. The CWL standards have no concept of a case.

* [Pattern 7 (Retain Familiar)](http://www.workflowpatterns.com/patterns/resource/creation/wrp7.php)

  No. However a workflow engine is allowed to schedule/place jobs to take
  advantage of data locality as an optimization.

* [Pattern 8 (Capability-Based Distribution)](http://www.workflowpatterns.com/patterns/resource/creation/wrp8.php)

  Yes, except there is no concept of "organisational model" in CWL.
  CWL `CommandLineTool`s can define minimum needed data storage and memory needs, along with the
  minimum number of CPU cores for efficient computation. These `ResourceRequirements`
  influence task placement.

  CWL versions: all

* [Pattern 9 (History-Based Distribution)](http://www.workflowpatterns.com/patterns/resource/creation/wrp9.php)

  No. Like Pattern 7 (Retain Faimiliar), this could be implemented by a workflow
  engine to optimize based upon the availability of intermediate results left
  over (or nearby) by a previous task.

* [Pattern 10 (Organisational Distribution)](http://www.workflowpatterns.com/patterns/resource/creation/wrp10.php)

  No. CWL has no concept of an "organization" or any entity similar to that.

* [Pattern 11 (Automatic Execution)](http://www.workflowpatterns.com/patterns/resource/creation/wrp11.php)

  By definition, all tasks in CWL are automatic as CWL has no concept of sending a task to a human.

  CWL versions: all

## "Push Patterns"

* [Pattern 12 (Distribution by Offer - Single Resource)](http://www.workflowpatterns.com/patterns/resource/push/wrp12.php)

  No.

* [Pattern 13 (Distribution by Offer - Multiple Resources)](http://www.workflowpatterns.com/patterns/resource/push/wrp13.php)

  No.

* [Pattern 14 (Distribution by Allocation - Single Resource)](http://www.workflowpatterns.com/patterns/resource/push/wrp14.php)

  No.

* [Pattern 15 (Random Allocation)](http://www.workflowpatterns.com/patterns/resource/push/wrp15.php)

  No.

* [Pattern 16 (Round Robin Allocation)](http://www.workflowpatterns.com/patterns/resource/push/wrp16.php)

  No.

* [Pattern 17 (Shortest Queue)](http://www.workflowpatterns.com/patterns/resource/push/wrp17.php)

  No.

* [Pattern 18 (Early Distribution)](http://www.workflowpatterns.com/patterns/resource/push/wrp18.php)

  No.

* [Pattern 19 (Distribution on Enablement)](http://www.workflowpatterns.com/patterns/resource/push/wrp19.php)

  No.

* [Pattern 20 (Late Distribution)](http://www.workflowpatterns.com/patterns/resource/push/wrp20.php)

  No.

## "Pull Patterns"

* [Pattern 21 (Resource-Initiated Allocation)](http://www.workflowpatterns.com/patterns/resource/pull/wrp21.php)

  No.

* [Pattern 22 (Resource-Initiated Execution - Allocated Work Item](http://www.workflowpatterns.com/patterns/resource/pull/wrp22.php)

  No.

* [Pattern 23 (Resource-Initiated Execution - Offered Work Item)](http://www.workflowpatterns.com/patterns/resource/pull/wrp23.php)

  No.

* [Pattern 24 (System-Determined Work Queue Content)](http://www.workflowpatterns.com/patterns/resource/pull/wrp24.php)

  No.

* [Pattern 25 (Resource-Determined Work Queue Content)](http://www.workflowpatterns.com/patterns/resource/pull/wrp25.php)

  No.

* [Pattern 26 (Selection Autonomy)](http://www.workflowpatterns.com/patterns/resource/pull/wrp26.php)

  No.

* [Pattern 21 (Resource-Initiated Allocation)](http://www.workflowpatterns.com/patterns/resource/pull/wrp21.php)

  No.

## "Detour Patterns"

* [Pattern 27 (Delegation)](http://www.workflowpatterns.com/patterns/resource/detour/wrp27.php)

  No.

* [Pattern 28 (Escalation)](http://www.workflowpatterns.com/patterns/resource/detour/wrp28.php)

  No.

* [Pattern 29 (Deallocation)](http://www.workflowpatterns.com/patterns/resource/detour/wrp29.php)

  No.

* [Pattern 30 (Stateful Reallocation)](http://www.workflowpatterns.com/patterns/resource/detour/wrp30.php)

  No.

* [Pattern 31 (Stateless Reallocation)](http://www.workflowpatterns.com/patterns/resource/detour/wrp31.php)

  No.

* [Pattern 32 (Suspension/Resumption)](http://www.workflowpatterns.com/patterns/resource/detour/wrp32.php)

  No.

* [Pattern 33 (Skip)](http://www.workflowpatterns.com/patterns/resource/detour/wrp33.php)

  No.

* [Pattern 34 (Redo)](http://www.workflowpatterns.com/patterns/resource/detour/wrp34.php)

  No. There is no method in CWL for a task to specify that some *other*
  already completed task must be redone.

  However, if a `CommandLineTool` exits with an return code indicated in the specified
  `temporaryFailCodes` list, then the task is available for retrying again.
  The CWL standards do not specify how many retries (if any) should be attempted.

* [Pattern 35 (Pre-Do)](http://www.workflowpatterns.com/patterns/resource/detour/wrp35.php)

  No. In CWL it is assumed that once a task has all of its inputs it is made
  available for execution.

## "Auto-Start Patterns"

* [Pattern 36 (Commencement on Creation)](http://www.workflowpatterns.com/patterns/resource/autostart/wrp36.php)

  No.

* [Pattern 37 (Commencement on Allocation)](http://www.workflowpatterns.com/patterns/resource/autostart/wrp37.php)

  No.

* [Pattern 38 (Piled Execution)](http://www.workflowpatterns.com/patterns/resource/autostart/wrp38.php)

  No. There is no specific construct in CWL to force pipelined execution,
  however the presence of `streamable: true` on matching inputs/outputs of
  adjacent tasks is a strong hint for those system who wish to do so.

* [Pattern 39 (Chained Execution)](http://www.workflowpatterns.com/patterns/resource/autostart/wrp39.php)

  No.

## "Visibility Patterns"

* [Pattern 40 (Configurable Unallocated Work Item Visibility)](http://www.workflowpatterns.com/patterns/resource/visibility/wrp40.php)

  No.

* [Pattern 41 (Configurable Allocated Work Item Visibility)](http://www.workflowpatterns.com/patterns/resource/visibility/wrp41.php)

  No.

## "Multiple Resource Patterns"

* [Pattern 42 (Simultaneous Execution)](http://www.workflowpatterns.com/patterns/resource/multiple_resources/wrp42.php)

  No, there is no explicit CWL construct for this. It is assumed that parallel
  execution, when possible, is wanted by the user. All known CWL implementations
  support parallel execution, and almost all of them do so by default.

* [Pattern 43 (Additional Resources)](http://www.workflowpatterns.com/patterns/resource/multiple_resources/wrp43.php)

  No.
