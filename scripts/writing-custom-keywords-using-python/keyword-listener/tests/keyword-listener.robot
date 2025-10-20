*** Settings ***
Documentation       Test suite


*** Test Cases ***
Divide By Zero
    [Documentation]    Divide By Zero
    Evaluate    10 / 0
