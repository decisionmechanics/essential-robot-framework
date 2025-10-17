*** Settings ***
Documentation       Test suite

Library             pabot.PabotLib


*** Test Cases ***
Set Shared Value
    [Documentation]    Sets a shared value in PabotLib for other tests to use
    Set Parallel Value For Key    shared_message    Hello from Set Shared Value!

Use Shared Value
    [Documentation]    Gets the shared value set by another test
    ${msg}=    Get Parallel Value For Key    shared_message
    Log    The shared message is: ${msg}
