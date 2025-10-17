*** Settings ***
Documentation       Test suite

Resource            ../resources/ordering.resource


*** Test Cases ***
Test Case F
    [Documentation]    Test case F
    Do Lengthy Test    F    5
