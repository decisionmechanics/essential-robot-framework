*** Settings ***
Documentation       Test suite

Library             String
Library             SeleniumLibrary


*** Variables ***
${URL}              https://www.amazon.co.uk/dp/B004UAZL5U
${TARGET_PRICE}     20.00


*** Tasks ***
Check Book Price On Amazon
    [Documentation]    Check Book Price on Amazon
    Open Browser    ${URL}    Edge
    Click Continue Shopping If Present
    Wait Until Page Contains Element    xpath=//span[@aria-label="Paperback Format:"]    10s
    ${price_span}=    Get WebElement
    ...    xpath=//span[@aria-label="Paperback Format:"]/../..//span[@class="slot-price"]/span
    ${price_text}=    Get Text    ${price_span}
    ${price}=    Convert Price To Number    ${price_text}
    IF    ${price} < ${TARGET_PRICE}
        Log    Price dropped! Current price: £${price}
    ELSE
        Log    Price is still high: £${price}
    END
    Close Browser


*** Keywords ***
Click Continue Shopping If Present
    [Documentation]    Click Continue Shopping If Present
    ${exists}=    Run Keyword And Return Status
    ...    Page Should Contain Element
    ...    xpath=//button[normalize-space(.)="Continue shopping"]
    IF    ${exists}
        Click Element    xpath=//button[normalize-space(.)="Continue shopping"]
        Log    Continue Shopping button was displayed
    ELSE
        Log    Continue Shopping button wasn't displayed
    END

Convert Price To Number
    [Documentation]    Convert Price to Number
    [Arguments]    ${price_text}
    ${clean}=    Replace String    ${price_text}    £    ${EMPTY}
    ${price}=    Convert To Number    ${clean}
    RETURN    ${price}
