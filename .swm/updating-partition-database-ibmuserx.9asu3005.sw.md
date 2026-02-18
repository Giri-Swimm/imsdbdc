---
title: Updating Partition Database (IBMUSERX)
---
This document explains the IBMUSERX job that updates partition records by processing input from a partition load file, applying necessary changes to the partition database, and logging all modifications in an IMS log file. This process ensures the partition database is kept current and changes are auditable. For example, new or updated partition records from the load file are reflected in the database and recorded in the log.

## Update Partition Database

Step in this section: `STEP1`.

This section updates partition records with the latest data and logs all modifications for auditing purposes.

1. The section reads partition records from the partition load file.
2. Each record is evaluated for whether it needs to be added, updated, or ignored based on partition database contents.
3. The necessary changes are applied to the partition database.
4. Every update or modification is logged in the IMS log file for auditing and tracking purposes.

### Input

**PARTDDIN - IBMUSER.XIMS.LOAD.FILE**

Partition load file containing input records for update.

**PARTDD01 - IBMUSER.XIMS.KSDS.PARTDBD1**

Partition database for storing updated records.

### Output

**PARTDD01 - IBMUSER.XIMS.KSDS.PARTDBD1**

Updated partition database containing new and modified records.

**IEFRDER - IBMUSER.IMSLOG.IMSDB**

IMS log file recording the database changes made during this update.

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBaW1zZGJkYyUzQSUzQUdpcmktU3dpbW0=" repo-name="imsdbdc"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
