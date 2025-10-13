*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Add Single Todo And Verify It Appears And Is Counted
    [Documentation]    Add a todo and verify it appears in the list
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    Edge
    Wait Until Element Is Visible    css=input.new-todo    10s
    Click Element    css=input.new-todo
    Input Text    css=input.new-todo    Create Robot Framework course
    Press Keys    css=input.new-todo    ENTER
    Wait Until Element Is Visible
    ...    xpath=//ul[contains(@class,'todo-list')]//label[normalize-space(.)="Create Robot Framework course"]
    ...    10s
    Close Browser
