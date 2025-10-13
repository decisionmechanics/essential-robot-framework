*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Variables ***
${URL}                      https:/wikipedia.org
${SEARCH_BOX_LOCATOR}       name=search
${ANIMAL}                   Hedgehog


*** Test Cases ***
Search For Animal On Wikipedia
    [Documentation]    Search for an animal on Wikipedia
    Open Browser    ${URL}    browser=Edge
    Wait Until Element Is Enabled    ${SEARCH_BOX_LOCATOR}
    Input Text    ${SEARCH_BOX_LOCATOR}    ${ANIMAL}
    Press Keys    ${SEARCH_BOX_LOCATOR}    ENTER
    Wait Until Page Contains    ${ANIMAL}
    Capture Page Screenshot
    Close All Browsers
