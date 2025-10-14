*** Settings ***
Documentation       Example test that validates a CSV file

Library             Collections
Library             OperatingSystem
Library             String


*** Variables ***
${FILE_PATH}            file-validation/data/users.csv
@{EXPECTED_HEADERS}     id    name    email


*** Test Cases ***
Verify CSV File Exists And Is Valid
    [Documentation]    Ensure the users.csv file exists, is not empty and has correct headers
    File Should Exist    ${FILE_PATH}
    ${size}=    Get File Size    ${FILE_PATH}
    Should Be True    ${size} > 0
    ${content}=    Get File    ${FILE_PATH}
    ${lines}=    Split String    ${content}    \n
    ${headers}=    Split String    ${lines}[0]    ,
    Lists Should Be Equal    ${headers}    ${EXPECTED_HEADERS}
