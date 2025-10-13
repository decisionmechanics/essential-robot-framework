*** Settings ***
Documentation       Test suite


*** Test Cases ***
Evaluate Test Scores
    [Documentation]    Iterate through student test scores
    VAR    @{scores}    85    -1    42    70    95    -1    60

    FOR    ${score}    IN    @{scores}
        IF    ${score} == -1
            Log    Student absent, skipping
            CONTINUE
        END

        IF    ${score} >= 70
            Log    Pass with score: ${score}
        ELSE
            Log    Fail with score: ${score}
        END
    END
