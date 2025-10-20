*** Settings ***
Documentation       Test suite


*** Test Cases ***
Safe Division
    [Documentation]    Demonstrates TRY/EXCEPT by handling division by zero.
    TRY
        ${result}=    Evaluate    10 / 0
        Log    Result is ${result}
    EXCEPT    *ZeroDivisionError*    type=GLOB    AS    ${error}
        Log    Cannot divide by zero, using default value 0
        Log    Oops...${error}
        VAR    ${result}=    0
    ELSE
        Log    Division successful
    FINALLY
        Log    Division attempt finished
    END

    Log    Final result: ${result}
