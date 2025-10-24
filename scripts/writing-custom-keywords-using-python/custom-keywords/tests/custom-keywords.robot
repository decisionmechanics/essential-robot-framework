*** Settings ***
Documentation       Test suite

Library             ../libraries/utilities.py


*** Variables ***
@{ANIMALS}=     cat    dog    rabbit    hedgehog    platypus


*** Test Cases ***
Check Random Number
    [Documentation]    Get a random number and check it's in the required range
    ${random_number}=    Get Random Number    10    50
    Log    Random number is: ${random_number}
    Should Be True    10 <= ${random_number} <= 50

Get Random Value
    [Documentation]    Select a random value from a list
    ${random_value}=    Select Random Value From List    ${ANIMALS}
    Log    ${random_value}

Should Be Equal As Sets
    [Documentation]    Check that two lists are equal when ignoring order and duplicates
    VAR    @{comparison_animals}=    dog    rabbit    cat    hedgehog    platypus    cat
    Should Be Equal As Sets    ${ANIMALS}    ${comparison_animals}
