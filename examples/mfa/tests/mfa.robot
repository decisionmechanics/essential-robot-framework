*** Comments ***
https://docs.robotframework.org/docs/examples/mfa_login


*** Settings ***
Documentation       Test Suite

Library             Browser
Library             ../libraries/totp.py

Suite Setup         New Browser    browser=${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser
Test Setup          New Context
Test Teardown       Close Context


*** Variables ***
${BROWSER}      chromium
${HEADLESS}     False


*** Test Cases ***
Login With MFA
    [Documentation]    Login using multi-factor authentication
    New Page    https://seleniumbase.io/realworld/login
    Fill Text    id=username    demo_user
    Fill Text    id=password    secret_pass
    ${totp}    Get TOTP    GAXG2MTEOR3DMMDG
    Fill Text    id=totpcode    ${totp}
    Click    "Sign in"
    Get Text    h1    ==    Welcome!
