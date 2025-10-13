*** Settings ***
Documentation       Login page

Resource            ../common.resource


*** Variables ***
${LOGIN_URL}        https://www.saucedemo.com/
${ERROR_BANNER}     data-test=error


*** Keywords ***
Go To Login Page
    [Documentation]    Go to login page
    Open Browser To    ${LOGIN_URL}

Login As
    [Documentation]    Login as
    [Arguments]    ${username}    ${password}
    Wait For And Type    id=user-name    ${username}
    Wait For And Type    id=password    ${password}
    Wait For And Click    id=login-button

Should Be On Login Page
    [Documentation]    Should be on login page
    Location Should Be    ${LOGIN_URL}

Should Show Error
    [Documentation]    Should show error
    [Arguments]    ${contains}
    Wait Until Element Is Visible    ${ERROR_BANNER}
    Element Should Contain    ${ERROR_BANNER}    ${contains}
