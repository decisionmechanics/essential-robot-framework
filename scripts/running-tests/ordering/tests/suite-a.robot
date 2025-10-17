*** Settings ***
Documentation       Test suite

Resource            ../resources/ordering.resource


*** Test Cases ***
Test Case A
    [Documentation]    Test case A
    Do Lengthy Test    A    5
