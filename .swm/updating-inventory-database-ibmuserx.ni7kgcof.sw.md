---
title: Updating Inventory Database (IBMUSERX)
---
The IBMUSERX job updates inventory records by processing existing database entries and related flow data. It applies business logic to determine necessary changes, updates the inventory database accordingly, and logs all modifications for traceability. For example, if a transaction indicates a sale of items, the job adjusts the inventory counts and records this update in the system log.

## Update Inventory Database

Step in this section: `STEP1`.

Runs the application logic to update inventory records and ensures changes are logged for auditing purposes.

- Existing inventory records and flow data are read from the database and related files.
- Application logic processes transactions or changes to determine which records must be updated, inserted, or deleted.
- The corresponding changes are made to the inventory database to ensure item counts and statuses are accurate.
- Each change is recorded in the system log to provide a traceable audit trail of all updates made to the data during this job run.

### Input

**PARTDD01 - IBMUSER.XIMS.KSDS.PARTDBD1 (Inventory Database)**

Contains existing records of inventory items prior to the update process.

**PART1FLW - IBMUSER.XIMS.ESDS.PARTDBD1 (Inventory Flow File)**

Provides additional information or flow data related to the inventory for processing.

### Output

**PARTDD01 - IBMUSER.XIMS.KSDS.PARTDBD1 (Updated Inventory Database)**

Reflects updates made to inventory records as a result of the processing.

**IEFRDER - IBMUSER.IMSLOG.IMSDB (IMS Log)**

Captures log entries for all inventory modifications performed during this process for auditing and traceability.

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBaW1zZGJkYyUzQSUzQUdpcmktU3dpbW0=" repo-name="imsdbdc"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
