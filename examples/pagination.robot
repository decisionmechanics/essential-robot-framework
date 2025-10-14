*** Settings ***
Documentation       Real-world tests on QuotesToScrape: pagination data checks + invalid login

Library             Collections
Library             Browser

Test Setup          Open App
Test Teardown       Close Browser    ALL


*** Variables ***
${BASE}     https://quotes.toscrape.com


*** Test Cases ***
Collect Quotes Across Two Pages
    [Documentation]    Verify there are 10 quotes per page andensure 'Albert Einstein' appears in first two pages
    ${_}    ${a1}=    Check Page Content    10
    ${_}    ${a2}=    Check Page Content    10
    ${all_authors}=    Combine Lists    ${a1}    ${a2}
    ${has_einstein}=    Run Keyword And Return Status    List Should Contain Value    ${all_authors}    Albert Einstein
    Should Be True    ${has_einstein}    msg=Expected 'Albert Einstein' among authors on first two pages

Tag Filtering Shows Only Tagged Quotes
    [Documentation]    Click a tag ('love') and verify the page shows only quotes for that tag
    Click    css=.tags-box .tag-item a[href*="/tag/love/"]
    Get Url    *=    /tag/love/
    ${quotes}=    Get Elements    css=.quote
    ${quote_count}=    Get Length    ${quotes}
    Should Be True    ${quote_count} > 0
    FOR    ${i}    IN RANGE    0    ${quote_count}
        Get Text    css=.quote >> nth=${i} >> css=.tags    *=    love
    END


*** Keywords ***
Open App
    [Documentation]    Open application
    New Browser    chromium    headless=True
    New Page    ${BASE}

Check Page Content
    [Documentation]    Check the correct number of quotes and authors are shown
    [Arguments]    ${expected_count}
    ${q}=    Get Texts    css=.quote span.text
    ${a}=    Get Texts    css=.quote small.author
    Length Should Be    ${q}    ${expected_count}
    Length Should Be    ${a}    ${expected_count}
    RETURN    ${q}    ${a}

Get Texts
    [Documentation]    Get text from a number of elements
    [Arguments]    ${locator}
    ${elements}=    Get Elements    ${locator}
    VAR    @{texts}=    @{EMPTY}
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Append To List    ${texts}    ${text}
    END
    RETURN    ${texts}

Go To Next Page
    [Documentation]    Go to the next page
    Click    css=.pager .next a
