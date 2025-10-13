*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Clicking Missing Element Should Fail
    [Documentation]    Expect a keyword to fail (and match the message)
    Run Keyword And Expect Error    *element not found*    Click Element    id=does-not-exist

Capture And Check Failure
    [Documentation]    Capture failure and assert on it
    ${status}    ${message}=    Run Keyword And Ignore Error    Click Element    id=does-not-exist
    Should Be Equal    ${status}    FAIL
    Should Contain    ${message}    element not found

Shows Validation Error
    [Documentation]    Assert UI error banners/message (app-level error)
    Click Button    id=login
    Page Should Contain Element    css=.error-message
    Element Text Should Be    css=.error-message    Invalid username or password

No Success Toast Means Error
    [Documentation]    Wait for absence to confirm an error state
    Wait Until Element Is Not Visible    css=.spinner    10s
    Page Should Not Contain Element    css=.toast--success

Eventually Shows Error
    [Documentation]    Retry something you expect to eventually fail/pass
    Wait Until Keyword Succeeds    3x    2s    Page Should Contain    Error
