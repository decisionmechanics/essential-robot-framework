*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Open Bing And Search
    [Documentation]    Open Bing and search
    Browse To Bing
    Search For Robot Framework
    Wait For Results
    Wait For Review
    Close Browser


*** Keywords ***
Browse To Bing
    [Documentation]    Browse to Bing
    Open Browser    https://www.bing.com    Edge

Search For Robot Framework
    [Documentation]    Search For Robot Framework
    Input Text    name=q    Robot Framework
    Press Keys    name=q    ENTER

Wait For Results
    [Documentation]    Wait For Results
    Wait Until Page Contains    Robot Framework

Wait For Review
    [Documentation]    Pause to allow search results to be seen
    Sleep    5s
