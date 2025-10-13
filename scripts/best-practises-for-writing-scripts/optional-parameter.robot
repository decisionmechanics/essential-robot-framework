*** Settings ***
Documentation       Test suite


*** Test Cases ***
Add A Single Todo
    [Documentation]    Add a single todo
    Add Todo


*** Keywords ***
Add Todo
    [Documentation]    Add a todo item to the list
    [Arguments]    ${item}=Do stuff
    Log    ${item}
