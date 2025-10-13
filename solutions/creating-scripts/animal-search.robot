*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Open Bing And Search For Hedgehogs
    [Documentation]    Open Bing and search for hedgehogs
    Open Browser    https://www.bing.com    Edge
    Input Text    name=q    Hedgehog
    Press Keys    name=q    ENTER
    Wait Until Page Contains    Hedgehog
    Sleep    5s
    Close Browser
