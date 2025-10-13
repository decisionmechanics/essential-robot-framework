*** Settings ***
Documentation       Test suite

Library             RequestsLibrary


*** Variables ***
${PET_ID}=      289273904


*** Test Cases ***
Add New Pet
    [Documentation]    Add a new pet
    VAR    &{body}=    id=${PET_ID}    name=Cuddles    status=available
    ${response}=    POST    https://petstore.swagger.io/v2/pet    json=${body}    expected_status=200
    Log    Pet ${response.json()}[id] added
