*** Settings ***
Documentation       Test suite

Resource            ./pages/todo.resource


*** Keywords ***
Add Todo
    [Documentation]    Add a todo item to the list
    [Arguments]    ${item}
    todo.Add Todo    $item}
