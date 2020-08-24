# WPI's [Exception Handling Patterns](http://www.workflowpatterns.com/patterns/exception/) and CWL

Broadly speaking, the CWL standards have little support for exception handling.

[Back to the list of WPI pattern categories](../README.md)

## [WPI Exception Types](http://www.workflowpatterns.com/patterns/exception/exceptiontypes.php)

### "Work Item Failure"

`CommandLineTool`s can define what exit codes represent successful execution,
or temporary or permanenet task execution failures. While there isn't a specific
CWL construct to verify the correct execution of a previous step, one can
evaluate any outputs (or even the workflow level inputs provided by the user)
and halt execution if they do not satisfy some criteria.

Starting with CWL v1.2 there can be alternative and/or supplementary execution
paths to cope with a step that ran without error but did not produce some
desired output or meet a particular threshold. However, as of CWL v1.2, there
is no ability in CWL to `loop` over a remediation step until a particular type
of result is obtained.

### "Deadline Expiry"

CWL has no concept of a task deadline.

Starting with CWL v1.1 it is possible to annotate CWL `CommandLineTool`s with a
[`ToolTimeLimit`](https://www.commonwl.org/v1.1/CommandLineTool.html#ToolTimeLimit)
that specified the maximum computation time that may pass once execution of a
`CommandLineTool` has begun..
However the result of missing the time limit is a permanent failure and CWL
does have any automatic recovery mechanism for permanent failures.

### "Resource Unavailability"

While the lack of needed resources can happen to a CWL workflow execution,
there is no CWL construct to automatically scale or otherwise attempt to
recover from such a situation. The providers of CWL compatible workflow
execution are allowed to implement their own solutions, otherwise manual
recovery is required.

### "External Trigger"

There is no concept of triggers in CWL.

### "Constraint Violation"

Beyond validation of the workflow description and the type compatibility
between processes, the only mechanism to check for constraint violation is
`pickValue`. `pickValue` appeared in version 1.2 of the CWL standards to
primarily cope with the results of conditional execution using the `when`
modifier on Workflow steps.

## ["Exception Handling at Work Item Level"](http://www.workflowpatterns.com/patterns/exception/exception_workitemlevel.php) patterns

There are no CWL constructs corresponding to any of the WPI exception handling
at the work item level patterns. However, many of these techniques are
used automatically by many CWL executors.


