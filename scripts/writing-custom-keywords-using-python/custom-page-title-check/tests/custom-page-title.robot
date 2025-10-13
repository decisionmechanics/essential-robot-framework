*** Settings ***
Documentation       Test suite

Library             ../libraries/web.py


*** Test Cases ***
Verify Homepage Title
    [Documentation]    Verify Robot Framework's homepage title
    Page Should Contain Title    https://robotframework.org    Robot Framework
