*** Settings ***
Documentation       App

Resource            ./common.resource
Resource            ./pages/login.resource
Resource            ./pages/inventory.resource
Resource            ./pages/cart.resource
Resource            ./pages/checkout.resource


*** Keywords ***
Log Into App
    [Documentation]    Log into app
    [Arguments]    ${username}    ${password}
    login.Login As    ${username}    ${password}
    inventory.Should Be On Inventory Page

Add Item To Cart
    [Documentation]    Add item to cart
    [Arguments]    ${item_name}    ${item_add_to_cart_slug}
    inventory.Add Item To Cart By Name    ${item_name}    ${item_add_to_cart_slug}
    inventory.Cart Badge Should Show    1

Open Cart Containing Item
    [Documentation]    Open the cart containing the item
    [Arguments]    ${item_name}
    inventory.Open Cart
    cart.Should Be On Cart Page
    cart.Should Contain Item    ${item_name}

Check Out
    [Documentation]    Check out
    [Arguments]    ${first_name}    ${last_name}    ${postal}
    cart.Proceed To Checkout
    checkout.Fill Shipping Info    ${first_name}    ${last_name}    ${postal}
    checkout.Finish Checkout
    checkout.Should See Order Complete
