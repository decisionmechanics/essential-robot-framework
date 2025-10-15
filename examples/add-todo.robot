*** Settings ***
Documentation       Test suite

Library             Browser

Test Setup          Open App
Test Teardown       Close Browser    ALL


*** Test Cases ***
Add A Todo Item And Check Count
    [Documentation]    Add a todo item
    Fill Text    .new-todo    Learn Robot Framework
    Press Keys    .new-todo    Enter
    Get Text    text=1 item left    ==    1 item left
    Close Browser    ALL


*** Keywords ***
Open App
    [Documentation]    Open TodoMVC app
    New Browser    chromium    headless=false
    New Page    https://todomvc.com/examples/javascript-es6/dist/
