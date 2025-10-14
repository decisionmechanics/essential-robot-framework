*** Settings ***
Documentation       Example API test using a real public API

Library             RequestsLibrary


*** Variables ***
${BASE_URL}     https://jsonplaceholder.typicode.com
${USER_ID}      1


*** Test Cases ***
Get User Details Should Return Correct Name
    [Documentation]    Verify that user with ID 1 has the expected name
    Create Session    json_api    ${BASE_URL}
    ${response}=    GET On Session    json_api    /users/${USER_ID}    expected_status=200
    VAR    ${json}=    ${response.json()}
    Log To Console    User name: ${json["name"]}
    Should Be Equal    ${json["name"]}    Leanne Graham
