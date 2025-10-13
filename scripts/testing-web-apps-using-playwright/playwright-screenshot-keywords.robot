*** Settings ***
Documentation       Test suite

Library             Browser


*** Test Cases ***
Capture A Screenshot
    [Documentation]    Capture a screenshot
    New Browser    chromium    headless=false    channel=msedge
    New Page    https://todomvc.com/examples/javascript-es6/dist/
    Fill Text    .new-todo    Learn Robot Framework
    Press Keys    .new-todo    Enter
    Take Screenshot
    Close Browser    ALL
