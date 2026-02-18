---
title: Processing Student Records (MSGSAMP1) - Overview
---
# Overview

This document explains how terminal input is processed to look up student records. Users enter a student ID via the terminal, and the system responds with the student name and a message indicating whether the record was found.

```mermaid
flowchart TD
    node1["Handling terminal input and database lookup
(Handling terminal input and database lookup)"]:::HeadingStyle --> node2{"Is terminal input valid?
(Handling terminal input and database lookup)"}:::HeadingStyle
    click node1 goToHeading "Handling terminal input and database lookup"
    node2 -->|"Yes"| node3{"Is student record found?"}
    click node2 goToHeading "Handling terminal input and database lookup"
    node2 -->|"No"| node4["Handling terminal input and database lookup
(Stop processing)
(Handling terminal input and database lookup)"]:::HeadingStyle
    click node4 goToHeading "Handling terminal input and database lookup"
    node3 -->|"Yes"| node5["Handling terminal input and database lookup
(Return student name and 'RECORD FOUND')
(Handling terminal input and database lookup)"]:::HeadingStyle
    click node5 goToHeading "Handling terminal input and database lookup"
    node3 -->|"No"| node6["Handling terminal input and database lookup
(Return 'RECORD NOT FOUND')
(Handling terminal input and database lookup)"]:::HeadingStyle
    click node6 goToHeading "Handling terminal input and database lookup"
classDef HeadingStyle fill:#777777,stroke:#333,stroke-width:2px;
```

## Dependencies

### Programs

- MSGSAMP1 (<SwmPath>[src/imsdc.cob](src/imsdc.cob)</SwmPath>)
- CBLTDLI

&nbsp;

*This is an auto-generated document by Swimm 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBaW1zZGJkYyUzQSUzQUdpcmktU3dpbW0=" repo-name="imsdbdc"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
