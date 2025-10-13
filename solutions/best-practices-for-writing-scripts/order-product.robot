*** Settings ***
Documentation       Test suite


*** Test Cases ***
Order Product Example
    [Documentation]    A simple demo test case that simulates ordering a product using only Log keywords
    Open Website
    Search Product
    Add Product To Cart
    Proceed To Checkout
    Make Payment
    Close Website


*** Keywords ***
Open Website
    [Documentation]    Logs the action of opening the shopping website
    Log    Opening the online shop

Search Product
    [Documentation]    Logs searching for a product called "Laptop"
    Log    Searching for "Laptop"

Add Product To Cart
    [Documentation]    Logs adding the product to the cart
    Log    Adding "Laptop" to the cart

Proceed To Checkout
    [Documentation]    Logs proceeding to the checkout page
    Log    Proceeding to checkout page

Make Payment
    [Documentation]    Logs making a payment with credit card
    Log    Making payment with credit card

Close Website
    [Documentation]    Logs closing the shopping website
    Log    Closing the online shop
