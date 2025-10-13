*** Settings ***
Documentation       Test suite

Library             RequestsLibrary


*** Variables ***
${PET_ID}=      289273904


*** Test Cases ***
Delete Pet
    [Documentation]    Delete a pet
    VAR    &{header}    api-key=special-key
    DELETE    https://petstore.swagger.io/v2/pet/${PET_ID}    headers=${header}    expected_status=200
    Log    Pet ${PET_ID} deleted
