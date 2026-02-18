---
title: Loading Participant Data (IBMUSERX)
---
The IBMUSERX job updates the participant database by processing new participant data files. It reads incoming participant records, matches them against existing entries, and inserts or updates records as needed. This process ensures the participant database remains accurate and up to date.

## Load Participant Data

Step in this section: `STEP1`.

This section updates the participant database by integrating new participant information received from an input file.

1. The incoming participant data file is read.
2. Each participant record is matched or integrated with existing participant database records.
3. New records are inserted, and existing records may be updated as appropriate.
4. The participant database is rewritten to include all new and updated participant information.

### Input

**PARTDDIN - IBMUSER.XIMS.LOAD.FILE**

Input file containing new participant data to be loaded into the database.

**PARTDD01 - IBMUSER.XIMS.KSDS.PARTDBD1**

Participant database (KSDS) before new data is loaded.

### Output

**PARTDD01 - IBMUSER.XIMS.KSDS.PARTDBD1**

Participant database (KSDS) updated with newly loaded participant records.

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBaW1zZGJkYyUzQSUzQUdpcmktU3dpbW0=" repo-name="imsdbdc"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
