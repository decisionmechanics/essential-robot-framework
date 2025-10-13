*** Settings ***
Documentation       Test suite

Library             Dialogs


*** Test Cases ***
Simple Dialogs Example
    [Documentation]    Demonstrates basic use of Dialogs library

    # Pause execution and wait for user to continue
    Pause Execution    Test is paused. Click OK to continue.

    # Ask the user for input
    ${name}=    Get Value From User    Please enter your name
    Log To Console    User entered: ${name}

    # Give the user a choice
    ${choice}=    Get Selection From User    Continue with test?    Yes    No
    Log    User selected: ${choice}
