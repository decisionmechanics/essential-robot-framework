*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Open Bing And Search
    [Documentation]    Open Bing and search
    Open Browser    https://www.bing.com    Edge
    Input Text    name=q    Robot Framework
    Press Keys    name=q    ENTER
    Wait Until Page Contains    Robot Framework
    Sleep    5s
    Close Browser
