---
title: Demonstrating GNP call usage (PART0009) - Overview
---
# Overview

This document explains the flow for retrieving parent segment price data. By setting domain-specific segment and price charge codes, the flow ensures that the correct parent segment price information is accessed from IMS for downstream processing.

## Dependencies

### Programs

- PART0009 (<SwmPath>[src/part0009.cob](src/part0009.cob)</SwmPath>)
- CBLTDLI
- ABENDPMG

### Copybooks

- PARTSG01 (<SwmPath>[src/partsg01.cpy](src/partsg01.cpy)</SwmPath>)
- PRICSG05 (<SwmPath>[src/pricsg05.cpy](src/pricsg05.cpy)</SwmPath>)
- ADDLSG07 (<SwmPath>[src/addlsg07.cpy](src/addlsg07.cpy)</SwmPath>)
- STCKSG10 (<SwmPath>[src/stcksg10.cpy](src/stcksg10.cpy)</SwmPath>)
- ORDSEG15 (<SwmPath>[src/ordseg15.cpy](src/ordseg15.cpy)</SwmPath>)

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBaW1zZGJkYyUzQSUzQUdpcmktU3dpbW0=" repo-name="imsdbdc"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
