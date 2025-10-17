*** Settings ***
Documentation       Test suite

Resource            ../resources/ordering.resource


*** Test Cases ***
Test Case C
    [Documentation]    Test case C
    Do Lengthy Test    C    5
