*** Settings ***
Documentation       Test suite

Library             DateTime
Library             Browser


*** Variables ***
${ADD_TODO_MAX}     2.0    # seconds
${ITEM}             Learn Robot Framework


*** Test Cases ***
Measure Add Todo Response
    [Documentation]    Time from Enter key to item rendered must be < ${ADD_TODO_MAX}s.
    New Browser    chromium    headless=false    channel=msedge
    New Page    https://todomvc.com/examples/javascript-es6/dist/
    Fill Text    .new-todo    ${ITEM}
    ${start_date_time}=    Get Current Date
    Press Keys    .new-todo    Enter
    Wait For Elements State    xpath=//li[contains(., "${ITEM}")]    visible
    ${duration}=    Get Duration    ${start_date_time}
    Log    Adding todo took ${duration} s (limit ${ADD_TODO_MAX}s)
    Should Be True    ${duration} < ${ADD_TODO_MAX}    msg=Add-todo too slow: ${duration}s >= ${ADD_TODO_MAX}s
    Close Browser    ALL


*** Keywords ***
Get Duration
    [Documentation]    Get duration (in seconds) between a date/time and now
    [Arguments]    ${start_date_time}
    ${now}=    Get Current Date
    ${duration}=    Subtract Date From Date    ${now}    ${start_date_time}
    RETURN    ${duration}
