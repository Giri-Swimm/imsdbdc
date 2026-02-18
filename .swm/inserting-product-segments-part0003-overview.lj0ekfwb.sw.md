---
title: Inserting Product segments (PART0003) - Overview
---
# Overview

This document explains the flow of processing input records and inserting database segments based on segment type. Each input record is routed to the appropriate insert routine, and the result of each insert is reported. Charge and stock segments invoke additional error handling if the insert fails.

## Dependencies

### Programs

- PART0003 (<SwmPath>[src/part0003.cob](src/part0003.cob)</SwmPath>)
- ABENDPGM
- CBLTDLI

### Copybooks

- PARTSG01 (<SwmPath>[src/partsg01.cpy](src/partsg01.cpy)</SwmPath>)
- PRICSG05 (<SwmPath>[src/pricsg05.cpy](src/pricsg05.cpy)</SwmPath>)
- ADDLSG07 (<SwmPath>[src/addlsg07.cpy](src/addlsg07.cpy)</SwmPath>)
- ORDSEG15 (<SwmPath>[src/ordseg15.cpy](src/ordseg15.cpy)</SwmPath>)
- STCKSG10 (<SwmPath>[src/stcksg10.cpy](src/stcksg10.cpy)</SwmPath>)

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBaW1zZGJkYyUzQSUzQUdpcmktU3dpbW0=" repo-name="imsdbdc"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
