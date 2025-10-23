*** Settings ***
Documentation       Test suite

Library             Collections
Library             RequestsLibrary


*** Test Cases ***
Get Pets Available For Purchase
    [Documentation]    Get a list of the pets available for purchase
    ${response}=    GET
    ...    https://petstore.swagger.io/v2/pet/findByStatus
    ...    params=status=available
    ...    expected_status=200
    VAR    ${available_pets}=    ${response.json()}
    ${count}=    Get Length    ${available_pets}
    Log    Number of pets available for purchase: ${count}
    Log Pets    ${available_pets}


*** Keywords ***
Log Pets
    [Documentation]    Log the names of the pets
    [Arguments]    ${pets}
    FOR    ${pet}    IN    @{pets}
        IF    "name" in $pet    Log    ${pet}[name]
    END
