*** Settings ***
Documentation       This is only for illustration

Library             SeleniumLibrary


*** Test Cases ***
Click Load More Until Gone
    [Documentation]    Clicks the "Load More" button repeatedly until it disappears
    Open Browser    https://example.com    Edge

    ${more}=    Load More Exists

    WHILE    ${more}    limit=50
        Click Button    css=button.load-more
        ${more}=    Load More Exists
    END

    Close Browser


*** Keywords ***
Load More Exists
    [Documentation]    Check if more data available
    RETURN    Run Keyword And Return Status    Page Should Contain Element    css=button.load-more
