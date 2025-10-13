*** Settings ***
Documentation       Test suite

Library             Browser


*** Variables ***
${URL}                      https:/wikipedia.org
${SEARCH_BOX_LOCATOR}       [name='search']
${ANIMAL}                   Hedgehog


*** Test Cases ***
Search For Animal On Wikipedia
    [Documentation]    Search for an animal on Wikipedia
    New Browser    chromium    headless=false    channel=msedge
    New Page    ${URL}
    Fill Text    ${SEARCH_BOX_LOCATOR}    ${ANIMAL}
    Press Keys    ${SEARCH_BOX_LOCATOR}    Enter
    Take Screenshot
    Close Browser    ALL
