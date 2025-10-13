*** Settings ***
Documentation       Test suite

Library             DateTime
Library             OperatingSystem


*** Test Cases ***
Process Report
    [Documentation]    Demonstrates OperatingSystem library in a non-web workflow:
    ...    - Create a directory for reports
    ...    - Generate a timestamped report file
    ...    - Validate file existence and size
    ...    - List directory contents
    ...    - Remove directory after processing

    Create Reports Folder
    ${filename}=    Create Timestamped Report
    Verify Non Empty File Exists    ${filename}
    Read File Content    ${filename}
    # Clean Up Reports Folder


*** Keywords ***
Create Reports Folder
    [Documentation]    Create reports folder
    Create Directory    ${CURDIR}/reports
    Directory Should Exist    ${CURDIR}/reports

Create Timestamped Report
    [Documentation]    Create a timestamped report file with sample content
    ${now}=    Get Current Date    result_format=%Y-%m-%d %H:%M:%S
    ${filestem}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${filename}=    Catenate    SEPARATOR=${EMPTY}    ${CURDIR}/reports/report-${filestem}.txt
    Create File    ${filename}    Report generated at ${now}\nOrders processed: 15
    RETURN    ${filename}

Verify Non Empty File Exists
    [Documentation]    Verify file exists and size is greater than 0
    [Arguments]    ${filename}
    File Should Exist    ${filename}
    ${size}=    Get File Size    ${filename}
    Should Be True    ${size} > 0

Read File Content
    [Documentation]    Read file content
    [Arguments]    ${filename}
    ${content}=    Get File    ${filename}
    Log    Report contents:\n${content}

List Files In Reports Folder
    [Documentation]    List files in the reports directory
    ${files}=    List Files In Directory    ${CURDIR}/reports
    Log    Found files: ${files}
    RETURN    ${files}

Clean Up Reports Folder
    [Documentation]    Clean up reports folder
    Remove Directory    ${CURDIR}/reports    recursive=True
    Directory Should Not Exist    ${CURDIR}/reports
