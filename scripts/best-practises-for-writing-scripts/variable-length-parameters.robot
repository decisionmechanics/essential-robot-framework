*** Settings ***
Documentation       Test suite


*** Test Cases ***
Pass Multiple Arguments
    [Documentation]    Add a single todo
    Log Parameters    One    Two    Three    Four    special=Pi


*** Keywords ***
Log Parameters
    [Documentation]    Log parameters
    [Arguments]    ${first}    ${second}    @{rest}    &{named}
    Log    First: ${first}
    Log    Second: ${second}
    Log    Rest: ${rest}
    Log    Named: ${named}
