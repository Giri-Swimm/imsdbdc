---
title: Processing Part Records (IBMUSERX)
---
This document explains the IBMUSERX job which manages part records by processing updates and lookups. The job receives part records and a sequential log as input, applies requested operations, and outputs the updated database along with a transaction log. For example, when a part record is updated, the job applies the change and records the transaction for traceability.

## Process Part Records

Step in this section: `STEP1`.

This section runs the main program to perform updates and lookups on part records, saving results and generating a transaction log.

1. The program receives part records from the primary database and the associated sequential log.
2. It performs requests to update, insert, delete, or read specific part records based on business operations.
3. All changes are applied directly to the main part database.
4. After each operation, a record is written to the IMS transaction log detailing the update or access.
5. The updated part database and log are saved as output for further auditing or system processing.

### Input

**PARTDBD1 - IBMUSER.XIMS.KSDS.PARTDBD1**

Main part records database input

**PARTDBD1_FLOW - IBMUSER.XIMS.ESDS.PARTDBD1**

Sequential log or audit trail of part changes

### Output

**PARTDBD1 - IBMUSER.XIMS.KSDS.PARTDBD1**

Updated part records database

**IEFRDER - IBMUSER.IMSLOG.IMSDB**

IMS transaction log containing an audit of all updates and lookups during this run

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBaW1zZGJkYyUzQSUzQUdpcmktU3dpbW0=" repo-name="imsdbdc"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
