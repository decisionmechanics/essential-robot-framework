*** Settings ***
Documentation       Test suite

Library             String


*** Test Cases ***
Validate Order Confirmation Response
    [Documentation]    Example test showing String library usage with a realistic API-style response

    VAR    ${response}=    {"order":"98765","customer":"Janet","status":"Pending"}

    # 1. Verify it's a string
    Should Be String    ${response}

    # 2. Ensure it contains the customer name
    Should Contain    ${response}    Janet

    # 3. Extract the order number substring
    ${order}=    Get Substring    ${response}    10    15
    Log To Console    Order number extracted: ${order}

    # 4. Validate format with a regexp (order must be digits)
    Should Match Regexp    ${response}    "order":"\\d+"

    # 5. Replace the status
    ${updated}=    Replace String    ${response}    Pending    Shipped
    Log    Updated response: ${updated}
