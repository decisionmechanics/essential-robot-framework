*** Settings ***
Documentation       Test suite

Library             Browser


*** Test Cases ***
Add A Todo Item And Check Count
    [Documentation]    Add a todo item
    New Browser    chromium    headless=false    channel=msedge
    New Page    https://todomvc.com/examples/javascript-es6/dist/
    Fill Text    .new-todo    Learn Robot Framework
    Press Keys    .new-todo    Enter
    Get Text    xpath=//span[contains(@class, "todo-count")]/strong    ==    1
    Close Browser    ALL
