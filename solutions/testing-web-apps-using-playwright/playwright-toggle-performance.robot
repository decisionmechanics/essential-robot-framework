*** Settings ***
Documentation       Test suite

Library             DateTime
Library             Browser

Test Setup          Open App
Test Teardown       Close Browser    ALL


*** Variables ***
${ADD_TODO_MAX}     2.0    # seconds
${TOGGLE_MAX}       1.0    # seconds
${ITEM}             Learn Robot Framework


*** Test Cases ***
Measure Add Todo Response
    [Documentation]    Time from Enter key to item rendered must be < ${ADD_TODO_MAX}s.
    Fill Text    .new-todo    ${ITEM}
    ${start_date_time}=    Get Current Date
    Press Keys    .new-todo    Enter
    Wait For Elements State    xpath=//li[contains(., "${ITEM}")]    visible
    ${duration}=    Get Duration    ${start_date_time}
    Log    Adding todo took ${duration} s (limit ${ADD_TODO_MAX}s)
    Should Be True    ${duration} < ${ADD_TODO_MAX}    msg=Add-todo too slow: ${duration}s >= ${ADD_TODO_MAX}s

Measure Toggle Todo Response
    [Documentation]    Time from Enter key to item rendered must be < ${ADD_TODO_MAX}s.
    Fill Text    .new-todo    ${ITEM}
    Press Keys    .new-todo    Enter
    ${start_date_time}=    Get Current Date
    Click    xpath=//li[contains(., "${ITEM}")]//input[@class="toggle"]
    Wait For Elements State    text=0 items left    visible
    ${duration}=    Get Duration    ${start_date_time}
    Log    Toggle completed in ${duration} s (limit ${TOGGLE_MAX}s)
    Should Be True    ${duration} < ${TOGGLE_MAX}    msg=Toggle too slow: ${duration}s >= ${TOGGLE_MAX}s


*** Keywords ***
Open App
    [Documentation]    Open TodoMVC home page
    New Browser    chromium    headless=false    channel=msedge
    New Page    https://todomvc.com/examples/javascript-es6/dist/

Get Duration
    [Documentation]    Get duration (in seconds) between a date/time and now
    [Arguments]    ${start_date_time}
    ${now}=    Get Current Date
    ${duration}=    Subtract Date From Date    ${now}    ${start_date_time}
    RETURN    ${duration}
