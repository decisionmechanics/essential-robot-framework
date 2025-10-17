*** Settings ***
Documentation       Test suite

Resource            ../resources/ordering.resource


*** Test Cases ***
Test Case D
    [Documentation]    Test case D
    Do Lengthy Test    D    5
