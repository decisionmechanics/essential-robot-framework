*** Settings ***
Documentation       Test suite

Test Template       Add Numbers Should Equal


*** Test Cases ***
Addition Tests
    [Tags]    math
    1    2    3
    5    5    10
    10    -2    8
    7    0    7


*** Keywords ***
Add Numbers Should Equal
    [Documentation]    Check that addition works...yes
    [Arguments]    ${a}    ${b}    ${expected}
    ${result}=    Evaluate    ${a} + ${b}
    Should Be Equal As Numbers    ${result}    ${expected}