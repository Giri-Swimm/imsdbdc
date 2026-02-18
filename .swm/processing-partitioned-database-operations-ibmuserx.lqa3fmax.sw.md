---
title: Processing Partitioned Database Operations (IBMUSERX)
---
This document explains the IBMUSERX job that processes customer transaction records in a partitioned database by applying business logic to update, insert, or delete records. It logs the results of these operations to maintain data integrity and provide traceability. For example, when a transaction record is updated, the job records the action in the log file.

## Partition Data Operation

Step in this section: `STEP1`.

Runs a program to process and update a partitioned database, recording results and logging each operation performed on the data.

1. The operation reads customer transaction records from the partitioned database input and its associated flow file.
2. For each record, application-specific business logic determines whether to update, insert, or delete it within the database.
3. Each operation (update, insert, delete) is applied directly to the data source.
4. Results of every performed operation, including status and any relevant details, are written to the log file output.

### Input

**PARTDD01 - IBMUSER.XIMS.KSDS.PARTDBD1**

Partitioned database input containing customer transaction records.

**PART1FLW - IBMUSER.XIMS.ESDS.PARTDBD1**

Log or flow file associated with database operations.

### Output

**IEFRDER - IBMUSER.IMSLOG.IMSDB**

Log file capturing the results and actions of the database process.

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBaW1zZGJkYyUzQSUzQUdpcmktU3dpbW0=" repo-name="imsdbdc"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
