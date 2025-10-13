*** Settings ***
Documentation       Test suite

Library             RequestsLibrary


*** Variables ***
${PET_ID}=      289273904


*** Test Cases ***
Sell Pet
    [Documentation]    Sell a pet
    POST
    ...    https://petstore.swagger.io/v2/pet/${PET_ID}
    ...    data={"name"="Cuddles", "status"="sold"}
    ...    expected_status=200
    Log    Pet ${PET_ID} sold
