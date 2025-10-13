*** Settings ***
Documentation       Test suite


*** Test Cases ***
Convert Text To Number
    [Documentation]    Demonstrates TRY/EXCEPT by handling invalid integer conversion.
    TRY
        ${num}=    Evaluate    int("one")
        Log    Converted number: ${num}
    EXCEPT    *ValueError*    type=GLOB    AS    ${error}
        Log    Conversion failed: ${error}
        VAR    ${num}=    0
    ELSE
        Log    Conversion succeeded
    FINALLY
        Log    Conversion attempt finished
    END

    Log    Final value: ${num}
