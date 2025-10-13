*** Settings ***
Documentation       Test suite


*** Test Cases ***
Looping Through Numbers
    [Documentation]    Loop through numbers 1 to 10
    FOR    ${i}    IN RANGE    1    11
        IF    ${i} % 2 == 0
            Log    Skipping even number: ${i}
            CONTINUE
        END

        IF    ${i} == 7
            Log    Reached 7, breaking loop
            BREAK
        END
        Log    Number: ${i}
    END
