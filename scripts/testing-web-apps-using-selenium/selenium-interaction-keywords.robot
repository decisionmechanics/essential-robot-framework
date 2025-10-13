*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Add A Todo Item
    [Documentation]    Add a todo item
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    browser=Edge
    Input Text    css=.new-todo    Learn Robot Framework
    Press Keys    css=.new-todo    ENTER
    Sleep    1s
    Close All Browsers
