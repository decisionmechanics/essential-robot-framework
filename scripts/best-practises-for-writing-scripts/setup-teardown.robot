*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary

Test Setup          Open App
Test Teardown       Close App


*** Test Cases ***
Add One Todo
    [Documentation]    Opens TodoMVC (via setup), adds one todo item, then closes the browser (via teardown)
    Add Todo    Buy milk

Add Two Todos
    [Documentation]    Opens TodoMVC (via setup), adds two todo items, then closes the browser (via teardown)
    Add Todo    Walk the dog
    Add Todo    Read a book


*** Keywords ***
Open App
    [Documentation]    Opens the TodoMVC app and maximises the browser window
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    Edge
    Maximize Browser Window

Add Todo
    [Documentation]    Adds a new todo item to the TodoMVC app. Takes one argument: the todo text.
    [Arguments]    ${item}
    Input Text    css=input.new-todo    ${item}
    Press Keys    css=input.new-todo    RETURN

Close App
    [Documentation]    Pauses before closing the TodoMVC app
    Sleep    5s
    Close Browser
