*** Settings ***
Documentation       Verify that Wikipedia shows dynamic search suggestions using Browser library

Library             Collections
Library             Browser

Test Setup          Open App
Test Teardown       Close Browser    ALL


*** Variables ***
${URL}                  https://www.wikipedia.org
${SEARCH_BOX}           css=input#searchInput
${SUGGESTION_BOX}       css=.suggestion-title
${SEARCH_TERM}          Robot Framework


*** Test Cases ***
Verify Search Suggestions Appear
    [Documentation]    Verify that typing a query in Wikipedia's search box shows suggestion results.
    Fill Text    ${SEARCH_BOX}    ${SEARCH_TERM}
    ${suggestions}=    Get Texts    ${SUGGESTION_BOX}
    Log    Found suggestions: ${suggestions}
    ${found}=    Evaluate    any("${SEARCH_TERM.lower()}" in s.lower() for s in ${suggestions})
    Should Be True    ${found}    msg=No suggestions contained the expected text

Verify Clicking A Suggestion Opens The Correct Page
    [Documentation]    Verify that clicking a suggestion navigates to the expected Wikipedia article.
    Fill Text    ${SEARCH_BOX}    ${SEARCH_TERM}
    Click    ${SUGGESTION_BOX} >> nth=0
    Get Title    *=    Robot Framework


*** Keywords ***
Open App
    [Documentation]    Open Wikipedia
    New Browser    chromium    headless=True
    New Page    ${URL}

Get Texts
    [Documentation]    Get list of element's text
    [Arguments]    ${locator}
    ${elements}=    Get Elements    ${locator}
    VAR    @{texts}=    []
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Append To List    ${texts}    ${text}
    END
    RETURN    ${texts}
