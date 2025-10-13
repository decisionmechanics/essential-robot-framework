*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Keywords ***
Add Todo
    [Documentation]    Add a todo item to the list
    [Arguments]    ${item}
    Input Text    css=input.new-todo    ${item}
    Press Keys    css=input.new-todo    RETURN
