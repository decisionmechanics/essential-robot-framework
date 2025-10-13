*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary

Test Setup          Browse To Bing
Test Teardown       Close App


*** Variables ***
${APP_URL}      https://www.bing.com


*** Test Cases ***
Open Bing And Search
    [Documentation]    Open Bing and search
    Search For Item    hedgehog
    Wait For Results    hedgehog


*** Keywords ***
Browse To Bing
    [Documentation]    Browse to Bing
    Open Browser    ${APP_URL}    %{BROWSER}

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

Close App
    [Documentation]    Pause before closing the browser
    Wait For Review
    Close Browser
