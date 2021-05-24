
# WPI's [Event Log Imperfection Patterns](http://www.workflowpatterns.com/patterns/logimperfection/) and CWL

Of the N WPI Event Log Imperfection patterns, X patterns are supported by CWL v1.2 or earlier and Y patterns are unsupported.

[Back to the list of WPI pattern categories](../README.md)


* [Pattern 1 (Form-based Event Capture)](http://www.workflowpatterns.com/patterns/logimperfection/elp1.php)

  *Data in event log is captured from an electronic form.*

  **No**. Although it might be implemented in the workflow management system, by default CWL specification doesn't define any special mechanisms for capturing and saving event logs. Note, `stdout` and `stderr` logs from the tools are not part of the event logs.

* [Pattern 2 (Inadvertent Time Travel)](http://www.workflowpatterns.com/patterns/logimperfection/elp2.php)

  *Entries in a log are recorded with an incorrect timestamp due to the ‘proximity’ of the correct value to the erroneously recorded value.*

  **No**. Although CWL specification doesn't define any special mechanisms for capturing and saving event logs, this pattern may occur on the workflow management system level. As an example, for a long time Airflow (and, as a result, CWL-Airflow too) internally used only UTC time zone. Users working in a different time zone could have potential difficulties in interpreting event logs.

* [Pattern 3 (Unanchored Event)](http://www.workflowpatterns.com/patterns/logimperfection/elp3.php)

  *Here the timestamp values of an event log are recorded in a format different from that which is expected by the tools used to process the event log.*

  **No**. Although CWL specification doesn't define any special mechanisms for capturing and saving event logs, this pattern may occur on the workflow management system (WMS) level and will be mostly result of a bug in that WMS rather then some misconception on the CWL level.

* [Pattern 4 (Scattered Event)](http://www.workflowpatterns.com/patterns/logimperfection/elp4.php)

  *The pattern refers to events in an event log which have attributes that contain further information that can be used to derive new events.*

  **Yes**. 

* [Pattern 5 (Elusive Case)](http://www.workflowpatterns.com/patterns/logimperfection/elp5.php)

* [Pattern 6 (Scattered Case)](http://www.workflowpatterns.com/patterns/logimperfection/elp6.php)

* [Pattern 7 (Collateral Events)](http://www.workflowpatterns.com/patterns/logimperfection/elp7.php)

* [Pattern 8 (Polluted Label)](http://www.workflowpatterns.com/patterns/logimperfection/elp8.php)

* [Pattern 9 (Distorted Label)](http://www.workflowpatterns.com/patterns/logimperfection/elp9.php)

* [Pattern 10 (Synonymous Labels)](http://www.workflowpatterns.com/patterns/logimperfection/elp10.php)

* [Pattern 11 (Homonymous Label)](http://www.workflowpatterns.com/patterns/logimperfection/elp11.php)