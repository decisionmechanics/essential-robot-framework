*** Settings ***
Documentation       Test suite


*** Test Cases ***
Check Parity
    [Documentation]    Check if the value of a variable is odd or even
    VAR    ${value}    7
    IF    ${value} % 2 == 0
        Log    ${value} is even
    ELSE
        Log    ${value} is odd
    END
