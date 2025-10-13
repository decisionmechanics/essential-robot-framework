*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Add Three Todos To TodoMVC With Good Locators
    [Documentation]    Opens the TodoMVC ES6 app and adds three todos using good locators
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    Edge
    Wait Until Element Is Visible    css=.new-todo

    Add Todo    Buy milk
    Add Todo    Walk dog
    Add Todo    Read book

    Wait Until Element Is Visible    css=.todo-list

    ${count}=    Get Element Count    css=.todo-list > [data-id]
    Should Be Equal As Integers    ${count}    3

    Close Browser


*** Keywords ***
Add Todo
    [Documentation]    Add todo
    [Arguments]    ${item}
    Input Text    css=.new-todo    ${item}
    Press Keys    css=.new-todo    RETURN
