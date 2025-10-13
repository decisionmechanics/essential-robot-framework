*** Settings ***
Documentation       Test suite

Library             ../libraries/performance.py


*** Test Cases ***
Time Keyword
    [Documentation]    Time a keyword
    ${duration}=    Measure Execution Time    Sleep    2
    Log    Took ${duration} seconds
