---
title: Updating Part Records (IBMUSERX)
---
The IBMUSERX job updates part records by reading input data and flow information, applying business transaction rules, writing updated records to the database, and logging changes for audit and recovery. For example, it modifies a part record as needed and logs the update to maintain traceability.

## Update Part Records

Step in this section: `STEP1`.

Executes business transaction updates to the part records database and writes related log entries.

1. The section reads input part records from the PARTDBD1 database and any associated flow information from PART1FLW.
2. Business transaction rules are applied to identify the updates needed (such as modification, insertion, or deletion of part records).
3. The identified changes are written back to the PARTDBD1 database, updating it with the new or modified records.
4. For every transactional update, a log entry is created and written to the IMSLOG data set, ensuring audit and recovery tracking.
5. The updated database and generated log outputs reflect both the input state and the business logic applied during processing.

### Input

**PARTDBD1 - IBMUSER.XIMS.KSDS.PARTDBD1**

Input part data records used for update operations.

**PARTDBD1_FLOW - IBMUSER.XIMS.ESDS.PARTDBD1**

Flow records for part transactions (may include sequence/audit data).

### Output

**PARTDBD1 - IBMUSER.XIMS.KSDS.PARTDBD1**

Part records updated with transactional changes.

**IMSLOG - IBMUSER.IMSLOG.IMSDB**

Log entries documenting database changes and related events.

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBaW1zZGJkYyUzQSUzQUdpcmktU3dpbW0=" repo-name="imsdbdc"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
