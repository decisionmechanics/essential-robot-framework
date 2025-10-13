*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary    timeout=10    run_on_failure=Capture Page Screenshot
Resource            ../resources/common.resource
Resource            ../resources/pages/login.resource
Resource            ../resources/pages/inventory.resource
Resource            ../resources/pages/cart.resource
Resource            ../resources/pages/checkout.resource
Resource            ../resources/swag-labs.resource

Suite Setup         Setup Browser
Suite Teardown      Close All Browsers
Test Teardown       Capture Page Screenshot


*** Variables ***
${APP_USERNAME}             standard_user
${APP_PASSWORD}             secret_sauce
${ITEM_NAME}                Sauce Labs Backpack
${ITEM_ADD_TO_CART_SLUG}    add-to-cart-sauce-labs-backpack
${CUSTOMER_FIRST_NAME}      jane
${CUSTOMER_LAST_NAME}       doe
${CUSTOMER_POSTAL}          SW1A 1AA


*** Test Cases ***
Purchase A Single Item
    [Documentation]    Purchase a single item
    Log Into App    ${APP_USERNAME}    ${APP_PASSWORD}
    Add Item To Cart    ${ITEM_NAME}    ${ITEM_ADD_TO_CART_SLUG}
    Open Cart Containing Item    ${ITEM_NAME}
    Check Out    ${CUSTOMER_FIRST_NAME}    ${CUSTOMER_LAST_NAME}    ${CUSTOMER_POSTAL}


*** Keywords ***
Setup Browser
    [Documentation]    Set up browser
    Go To Login Page
