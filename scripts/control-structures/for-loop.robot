*** Settings ***
Documentation       Test suite


*** Test Cases ***
Simple For Loop
    [Documentation]    This test demonstrates a basic FOR loop
    VAR    @{animals}    Cat    Dog    Hedgehog

    FOR    ${animal}    IN    @{animals}
        Log    Animal: ${animal}
    END
