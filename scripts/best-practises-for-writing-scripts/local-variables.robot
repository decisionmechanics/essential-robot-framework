*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary

Test Setup          Open App
Test Teardown       Close App


*** Test Cases ***
Add One Todo
    [Documentation]    Opens TodoMVC (via setup), adds one todo item, then closes the browser (via teardown)
    Add Todo    Buy milk


*** Keywords ***
Open App
    [Documentation]    Opens the TodoMVC app and maximises the browser window
    VAR    ${app_url}    https://todomvc.com/examples/javascript-es6/dist/
    VAR    ${browser}    Edge
    Open Browser    ${app_url}    ${browser}
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
