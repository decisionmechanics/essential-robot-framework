*** Settings ***
Documentation       Keywords for parallel ordering demo


*** Keywords ***
Do Lengthy Test
    [Documentation]    Do a test that takes a log of time
    [Arguments]    ${id}    ${duration}
    Log    Starting test case ${id}...    console=True
    Sleep    ${duration}s
    Log    Completed test case ${id}    console=True
