*** Settings ***
Documentation       Cart page

Resource            ../common.resource


*** Keywords ***
Should Be On Cart Page
    [Documentation]    Should be on cart page
    Should Be On URL    cart.html
    Element Should Be Visible    css=.title

Should Contain Item
    [Documentation]    Should contain item
    [Arguments]    ${name}
    Wait Until Page Contains    ${name}

Proceed To Checkout
    [Documentation]    Proceed to checkout
    Wait For And Click    id=checkout
