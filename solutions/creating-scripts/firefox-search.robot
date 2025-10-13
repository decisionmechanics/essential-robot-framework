*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Open Bing And Search In Firefox
    [Documentation]    Open Bing and search in Firefox
    Open Browser    https://www.bing.com    Firefox
    Input Text    name=q    Robot Framework
    Press Keys    name=q    ENTER
    Wait Until Page Contains    Robot Framework
    Sleep    5s
    Close Browser
