*** Settings ***
Documentation       Test suite

Library             Browser


*** Test Cases ***
Log Current URL
    [Documentation]    Browse to TodoMVC app and log the current URL
    New Browser    chromium    headless=false    channel=msedge
    New Page    https://todomvc.com/examples/javascript-es6/dist/
    ${current_url}=    Get Url
    Log    Current page URL: ${current_url}
    Close Browser    ALL
