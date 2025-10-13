*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Add A Todo Item
    [Documentation]    Add a todo item
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    browser=Edge
    Input Text    css=.new-todo    Learn Robot Framework
    Press Keys    css=.new-todo    ENTER
    Wait Until Page Contains    1 item left
    Close All Browsers
