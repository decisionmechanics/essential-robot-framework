*** Settings ***
Documentation       Test suite

Library             Browser


*** Test Cases ***
Expect Error When Clicking Missing Delete
    [Documentation]    Checks that an error occurs when attempting to click a missing Delete button
    New Browser    chromium    headless=false    channel=msedge
    New Page    https://todomvc.com/examples/javascript-es6/dist/
    Run Keyword And Expect Error    *TimeoutError: locator.click*    Click    text=Delete
    Close Browser    ALL
