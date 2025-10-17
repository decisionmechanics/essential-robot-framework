*** Settings ***
Documentation       Checkout page

Resource            ../common.resource


*** Variables ***
${THANK_YOU_LOCATOR}    css=.complete-header


*** Keywords ***
Fill Shipping Info
    [Documentation]    Fill in shipping details
    [Arguments]    ${first}    ${last}    ${postal}
    Wait For And Type    id=first-name    ${first}
    Wait For And Type    id=last-name    ${last}
    Wait For And Type    id=postal-code    ${postal}
    Wait For And Click    id=continue

Finish Checkout
    [Documentation]    Finish checkout
    Wait For And Click    id=finish

Should See Order Complete
    [Documentation]    Should see order complete
    Wait Until Element Is Visible    ${THANK_YOU_LOCATOR}
    Element Should Contain    ${THANK_YOU_LOCATOR}    Thank you for your order!

Back To Products
    [Documentation]    Go back to products
    Wait For And Click    id=back-to-products
