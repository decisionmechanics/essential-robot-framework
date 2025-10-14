*** Settings ***
Documentation       Real-world login flow tests using Robot Framework Browser

Library             Browser

Test Setup          Open App
Test Teardown       Close Browser    ALL


*** Variables ***
${BASE}             https://the-internet.herokuapp.com
${LOGIN_URL}        ${BASE}/login
${VALID_USER}       tomsmith
${VALID_PASS}       SuperSecretPassword!
${FLASH}            css=#flash


*** Test Cases ***
Successful Login Shows Secure Area
    [Documentation]    Verify valid credentials log in and show success message.

    Wait For Elements State    css=input#username    visible
    Fill Text    css=input#username    ${VALID_USER}
    Fill Text    css=input#password    ${VALID_PASS}
    Click    css=button[type="submit"]
    ${msg}=    Get Text    ${FLASH}
    Should Contain    ${msg}    You logged into a secure area!
    Click    css=a.button.secondary.radius
    Get Text    h2    ==    Login Page

Invalid Password Shows Error
    [Documentation]    Verify invalid password displays the appropriate error message.
    Fill Text    css=input#username    ${VALID_USER}
    Fill Text    css=input#password    wrong-password
    Click    css=button[type="submit"]
    Get Text    ${FLASH}    *=    Your password is invalid!

Missing Username Shows Error
    [Documentation]    Verify submitting with no username shows an invalid username message.
    Fill Text    css=input#password    ${VALID_PASS}
    Click    css=button[type="submit"]
    Get Text    ${FLASH}    *=    Your username is invalid!


*** Keywords ***
Open App
    [Documentation]    Open application
    New Browser    chromium    headless=False
    New Page    ${LOGIN_URL}
