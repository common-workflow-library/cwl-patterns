
# WPI's [Event Log Imperfection Patterns](http://www.workflowpatterns.com/patterns/logimperfection/) and CWL

Of the 11 WPI Event Log Imperfection patterns, 0 patterns are supported by CWL v1.2 or earlier and 11 patterns are unsupported. Most of the patterns below are more like "anti-patterns" which should be avoided as they make process mining analysis more complicated.

CWL specification doesn't define any special mechanisms for capturing and saving event logs. Redirecting `stdout` and `stderr` streams to files is not part of the event logs system. Some of the Event Log Imperfection patters may still occur on the workflow management system level.

[Back to the list of WPI pattern categories](../README.md)


* :negative_squared_cross_mark: [Pattern 1 (Form-based Event Capture)](http://www.workflowpatterns.com/patterns/logimperfection/elp1.php)

  *Data in event log is captured from an electronic form. All data items captured on the form have the same timestamp.*

  **No.**

* :negative_squared_cross_mark: [Pattern 2 (Inadvertent Time Travel)](http://www.workflowpatterns.com/patterns/logimperfection/elp2.php)

  *Entries in a log are recorded with an incorrect timestamp due to the ‘proximity’ of the correct value to the erroneously recorded value.*

  **No.** However, this pattern may occur on the workflow management system level. As an example, for a long time Airflow (and, as a result, CWL-Airflow too) internally used only UTC time zone. Users working in a different time zone could have potential difficulties in interpreting event logs.

* :negative_squared_cross_mark: [Pattern 3 (Unanchored Event)](http://www.workflowpatterns.com/patterns/logimperfection/elp3.php)

  *The timestamp values of an event log are recorded in a format different from that which is expected by the tools used to process the event log.*

  **No.** However, this pattern may occur on the workflow management system level. As an example, Airflow allows to define custom format for event log messages. This may bring potential problems when parsing event log files.

* :negative_squared_cross_mark: [Pattern 4 (Scattered Event)](http://www.workflowpatterns.com/patterns/logimperfection/elp4.php)

  *This pattern refers to events in an event log which have attributes that contain further information that can be used to derive new events.*

  **No.** However, this pattern may occur on the workflow management system level. As an example, by default CWL-Airflow allows several retries for the failed task. Every task execution results in creation of the separate event log files, however they are all still accessible by retry attempt number.

* :negative_squared_cross_mark: [Pattern 5 (Elusive Case)](http://www.workflowpatterns.com/patterns/logimperfection/elp5.php)

  *Events in a log are not explicitly linked to their case identifiers.*

  **No.** However, this pattern may occur on the workflow management system level. As an example, for bioinformatics workflows the case identifier will be the job description object that defines input data for workflow run. If event logs omit that information, users may have problems with linking the log events to their case identifiers.

* :negative_squared_cross_mark: [Pattern 6 (Scattered Case)](http://www.workflowpatterns.com/patterns/logimperfection/elp6.php)

  *Key process steps are missing in the event log, but they are recorded elsewhere, thus bringing a potential 'record linkage' problem.*
  
  **No.** However, this pattern may occur on the workflow management system level. As an example, if CWL-Airflow used SubDags to run subworkflows, their event logs would be disconnected from the event log of the main workflow.

* :negative_squared_cross_mark: [Pattern 7 (Collateral Events)](http://www.workflowpatterns.com/patterns/logimperfection/elp7.php)

  *Multiple events in a log that refer to a single process step within a case.*

  **No.** However, this pattern may occur on the workflow management system level. As an example, jobs from the scattered workflow step report events in parallel.

* :negative_squared_cross_mark: [Pattern 8 (Polluted Label)](http://www.workflowpatterns.com/patterns/logimperfection/elp8.php)

  *This pattern refers to the presence of a group of event attribute values that are structurally the same, yet are distinct from each other due to differences in the exact attribute values that further qualifies the meaning of the value.*

  **No.** However, this pattern may occur on the workflow management system level. As an example, workflow run identifier may include workflow name and some unique identifier. All the events related to multiple runs of the same workflow will include both immutable (workflow name) and mutable (unique identifier) parts. This may potentially result in over-fitting the event log as there will be many specific activities that should have been firstly abstracted out.

* :negative_squared_cross_mark: [Pattern 9 (Distorted Label)](http://www.workflowpatterns.com/patterns/logimperfection/elp9.php)

  *This pattern refers to the existence of two or more values of an event attribute that are not an exact match with each other but have strong similarities syntactically and semantically.*
  
  **No.**

* :negative_squared_cross_mark: [Pattern 10 (Synonymous Labels)](http://www.workflowpatterns.com/patterns/logimperfection/elp10.php)

  *The synonymous label pattern refers to a situation whereby there is a group of values that are syntactically different but semantically similar.*

  **No.**

* :negative_squared_cross_mark: [Pattern 11 (Homonymous Label)](http://www.workflowpatterns.com/patterns/logimperfection/elp11.php)

  *This pattern describes a situation where an activity is repeated multiple times within a case, but the interpretation of the activity, from a process perspective, differs between first and subsequent occurrences.*

  **No.** However, this pattern may occur on the workflow management system level. As an example, jobs from the scattered workflow step report events with the same identifier and as a result are mistakenly grouped together.