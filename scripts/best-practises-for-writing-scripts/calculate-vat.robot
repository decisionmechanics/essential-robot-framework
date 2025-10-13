*** Settings ***
Documentation       Test suite


*** Test Cases ***
Get VAT Inclusive Price
    [Documentation]    Calculates the price inclusive of sales tax
    ${vat_inclusive_price}=    Calculate Sales Tax Inclusive Price    35    20
    Log    VAT inclusive price: ${vat_inclusive_price}


*** Keywords ***
Calculate Sales Tax Inclusive Price
    [Documentation]    Calculates the price inclusive of sales tax
    [Arguments]    ${price}    ${rate}
    ${sales_tax_inclusive_price}=    Evaluate    ${price} * (1 + ${rate} / 100)
    RETURN    ${sales_tax_inclusive_price}
