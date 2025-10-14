*** Settings ***
Documentation       Simple test on Wikipedia search

Library             Browser


*** Variables ***
${URL}              https://www.wikipedia.org
${SEARCH_TERM}      Robot Framework


*** Test Cases ***
Search Wikipedia For Robot Framework
    [Documentation]    Open Wikipedia and verify the search works
    New Browser    chromium    headless=False
    New Page    ${URL}
    Get Title    ==    Wikipedia
    Fill Text    id=searchInput    ${SEARCH_TERM}
    Click    [data-jsl10n="search-input-button"]
    ${title}=    Get Title
    Should Contain    ${title}    ${SEARCH_TERM}
    Close Browser
