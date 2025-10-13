*** Settings ***
Documentation       Test suite


*** Test Cases ***
Check OS Env
    [Documentation]    Check the OS
    ${os}=    Evaluate    platform.system()    platform

    IF    $os == 'Windows'
        Log    Do Windows-specific steps
    ELSE IF    $os == 'Linux'
        Log    Do Linux-specific steps
    ELSE IF    $os == 'Darwin'
        Log    Do macOS-specific steps
    ELSE
        Log    Unknown OS (${os})
    END
