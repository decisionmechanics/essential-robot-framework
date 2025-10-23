*** Settings ***
Documentation       Performance tests

Library             SeleniumLibrary

Test Setup          Open Browser    about:blank    Edge
Test Teardown       Close All Browsers


*** Variables ***
${URL}              https://todomvc.com/examples/javascript-es6/dist/
${PAGE_LOAD_MAX}    3.0    # seconds
${ADD_TODO_MAX}     2.0    # seconds
${ITEM}             Learn Robot Framework


*** Test Cases ***
Measure Page Load Time
    [Documentation]    Time from navigation to input readiness must be < ${PAGE_LOAD_MAX}s.
    ${start_time}=    Get Start Time
    Go To    ${URL}
    Wait Until Page Contains Element    css=.new-todo
    ${duration}=    Get Duration    ${start_time}
    Log    Page loaded in ${duration} s (limit ${PAGE_LOAD_MAX}s)
    Should Be True    ${duration} < ${PAGE_LOAD_MAX}    msg=Page load too slow: ${duration}s >= ${PAGE_LOAD_MAX}s

Measure Add Todo Response
    [Documentation]    Time from ENTER key to item rendered must be < ${ADD_TODO_MAX}s.
    Go To    ${URL}
    Input Text    css=.new-todo    ${ITEM}
    ${start_time}=    Get Start Time
    Press Keys    css=.new-todo    ENTER
    Wait Until Page Contains Element    xpath=//li[contains(., "${ITEM}")]
    ${duration}=    Get Duration    ${start_time}
    Log    Adding todo took ${duration} s (limit ${ADD_TODO_MAX}s)
    Should Be True    ${duration} < ${ADD_TODO_MAX}    msg=Add-todo too slow: ${duration}s >= ${ADD_TODO_MAX}s


*** Keywords ***
Get Start Time
    [Documentation]    Get start time
    ${time}=    Get Time    epoch
    RETURN    ${time}

Get Duration
    [Documentation]    Get duration
    [Arguments]    ${start_time}
    ${end_time}=    Get Time    epoch
    ${duration}=    Evaluate    ${end_time} - ${start_time}
    RETURN    ${duration}
