---
title: Demonstrating GN call usage (PART0005) - Overview
---
# Overview

This document describes the process of retrieving and handling unqualified segments from a database. The flow fetches segment data, displays it when successful, and stops or handles errors based on the status code returned after each retrieval.

```mermaid
flowchart TD
    node1["Retrieving and Handling Unqualified Segments
(Retrieving and Handling Unqualified Segments)"]:::HeadingStyle
    node1 --> node2{"Status code after retrieval?
(Retrieving and Handling Unqualified Segments)"}:::HeadingStyle
    node2 -->|"Blank"|node1
    node2 -->|"GB"|node3["Stop retrieval loop
(Retrieving and Handling Unqualified Segments)"]:::HeadingStyle
    node2 -->|"Other"|node1

    click node1 goToHeading "Retrieving and Handling Unqualified Segments"
    click node2 goToHeading "Retrieving and Handling Unqualified Segments"
    click node3 goToHeading "Retrieving and Handling Unqualified Segments"
classDef HeadingStyle fill:#777777,stroke:#333,stroke-width:2px;
```

## Dependencies

### Programs

- PART0005 (<SwmPath>[src/part0005.cob](src/part0005.cob)</SwmPath>)
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
