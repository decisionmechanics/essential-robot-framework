*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Keywords ***
Open App
    [Documentation]    Open the TodoMVC app in Edge and maximise the browser window
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Wait For Review
    [Documentation]    Pause to allow the results to be seen
    [Arguments]    ${duration}
    Sleep    ${duration}

Close App
    [Documentation]    Close the browser
    Close Browser
