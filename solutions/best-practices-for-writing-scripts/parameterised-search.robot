*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Open Bing And Search
    [Documentation]    Open Bing and search
    Browse To Bing
    Search For Item    hedgehog
    Wait For Results    hedgehog
    Wait For Review
    Close Browser


*** Keywords ***
Browse To Bing
    [Documentation]    Browse to Bing
    Open Browser    https://www.bing.com    Edge

Search For Item
    [Documentation]    Search For Item
    [Arguments]    ${item}
    Input Text    name=q    ${item}
    Press Keys    name=q    ENTER

Wait For Results
    [Documentation]    Wait For Results
    [Arguments]    ${term}
    Wait Until Page Contains    ${term}

Wait For Review
    [Documentation]    Pause to allow search results to be seen
    Sleep    5s
