*** Settings ***
Documentation       Helper methods

Library             Collections
Library             SeleniumLibrary    timeout=10    run_on_failure=Capture Page Screenshot


*** Keywords ***
Open Browser To
    [Documentation]    Open browser to URL
    [Arguments]    ${url}    ${browser}=Edge
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Wait For And Click
    [Documentation]    Wait for item to appear then click it
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Wait For And Type
    [Documentation]    Wait for item to appear then enter something
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}
    Clear Element Text    ${locator}
    Input Text    ${locator}    ${text}

Should Be On URL
    [Documentation]    Should be on URL
    [Arguments]    ${fragment}
    Location Should Contain    ${fragment}

Element Text Should Be
    [Documentation]    Element text should be
    [Arguments]    ${locator}    ${expected}
    Wait Until Element Is Visible    ${locator}
    ${txt}=    Get Text    ${locator}
    Should Be Equal    ${txt}    ${expected}
