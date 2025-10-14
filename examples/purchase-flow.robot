*** Settings ***
Documentation       E2E purchase flow on saucedemo: login, add to cart, checkout, and verify completion

Library             Browser

Test Setup          Open App
Test Teardown       Close Browser    ALL


*** Variables ***
${BASE}                 https://www.saucedemo.com
${USERNAME_OK}          standard_user
${USERNAME_LOCKED}      locked_out_user
${PASSWORD}             secret_sauce


*** Test Cases ***
Successful Purchase Flow
    [Documentation]    Log in, add a product, complete checkout and verify thank-you message
    Log In    ${USERNAME_OK}    ${PASSWORD}
    Click    css=button[data-test="add-to-cart-sauce-labs-backpack"]
    Click    css=#shopping_cart_container a
    Click    css=#checkout
    Fiil Out User Details
    Click    css=#continue
    Click    css=#finish
    Get Text    css=.complete-header    ==    Thank you for your order!

Locked Out User Shows Error
    [Documentation]    Attempt login with locked_out_user and verify the error message is displayed
    Log In    ${USERNAME_LOCKED}    ${PASSWORD}
    Get Text    css=[data-test="error"]    *=    Sorry, this user has been locked out.


*** Keywords ***
Open App
    [Documentation]    Open Swag Labs application
    New Browser    chromium    headless=False
    New Page    ${BASE}

Log In
    [Documentation]    Log in
    [Arguments]    ${username}    ${password}
    Fill Text    css=#user-name    ${username}
    Fill Text    css=#password    ${password}
    Click    css=#login-button

Fiil Out User Details
    [Documentation]    Fill out delivery user details
    Fill Text    css=#first-name    Jane
    Fill Text    css=#last-name    Doe
    Fill Text    css=#postal-code    SW1A 1AA
