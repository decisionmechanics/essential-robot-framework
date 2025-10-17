*** Settings ***
Documentation       Locking demo

Library             pabot.pabotlib


*** Test Cases ***
Test Case 1
    [Documentation]    Test case 1
    Do Lengthy Test    1    5

Test Case 2
    [Documentation]    Test case 2
    Do Lengthy Test    2    5

Test Case 3
    [Documentation]    Test case 3
    Do Lengthy Test    3    5

Test Case 4
    [Documentation]    Test case 4
    Acquire Lock    my-lock
    Do Lengthy Test    4    5
    Release Lock    my-lock

Test Case 5
    [Documentation]    Test case 5
    Acquire Lock    my-lock
    Do Lengthy Test    5    5
    Release Lock    my-lock

Test Case 6
    [Documentation]    Test case 6
    Do Lengthy Test    6    5


*** Keywords ***
Do Lengthy Test
    [Documentation]    Do a test that takes a log of time
    [Arguments]    ${id}    ${duration}
    Log    Starting test case ${id}...    console=True
    Sleep    ${duration}s
    Log    Completed test case ${id}    console=True
