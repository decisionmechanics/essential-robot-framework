*** Settings ***
Documentation       Test suite


*** Test Cases ***
Calculate Fibonacci Numbers
    [Documentation]    Calculate Fibonacci numbers up to 100
    VAR    ${a}    0
    VAR    ${b}    1
    VAR    ${next}    0

    WHILE    ${next} <= 100    limit=100
        Log    Fibonacci: ${next}

        ${next}    Evaluate    ${a} + ${b}

        VAR    ${a}    ${b}
        VAR    ${b}    ${next}
    END
