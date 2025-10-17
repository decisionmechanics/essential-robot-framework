*** Settings ***
Documentation       Test suite

Resource            ../resources/ordering.resource


*** Test Cases ***
Test Case B
    [Documentation]    Test case B
    Do Lengthy Test    B    5
