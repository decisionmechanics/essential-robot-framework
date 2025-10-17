*** Settings ***
Documentation       Inventory page

Resource            ../common.resource


*** Keywords ***
Should Be On Inventory Page
    [Documentation]    Should be on inventory page
    Should Be On URL    inventory.html
    Element Should Be Visible    css=.app_logo

Add Item To Cart By Name
    [Documentation]    Add item to cart by name
    [Arguments]    ${name}    ${add_to_cart_slug}
    Wait Until Page Contains    ${name}
    Click Element    css=[data-test="${add_to_cart_slug}"]

Open Cart
    [Documentation]    Open cart
    Wait For And Click    id=shopping_cart_container

Cart Badge Should Show
    [Documentation]    Cart badge should show
    [Arguments]    ${count}
    Element Text Should Be    css=.shopping_cart_badge    ${count}
