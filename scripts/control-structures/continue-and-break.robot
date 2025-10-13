*** Settings ***
Documentation       Test suite


*** Test Cases ***
For Loop With Continue And Break
    [Documentation]    Show how CONTINUE skips an iteration and BREAK stops the loop completely
    VAR    @{animals}    Cat    Dog    Mouse    Hedgehog    Lion

    FOR    ${animal}    IN    @{animals}
        IF    '${animal}' == 'Mouse'
            Log    Skipping Mouse
            CONTINUE
        END
        IF    '${animal}' == 'Hedgehog'
            Log    Found Hedgehog, stopping loop
            BREAK
        END
        Log    Animal: ${animal}
    END
