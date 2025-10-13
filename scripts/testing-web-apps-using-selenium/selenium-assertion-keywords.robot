*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Add A Todo Item And Check Count
    [Documentation]    Add a todo item
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    browser=Edge
    Input Text    css=.new-todo    Learn Robot Framework
    Press Keys    css=.new-todo    ENTER
    Wait Until Element Is Visible    css=.todo-count
    Element Should Contain    xpath=//span[contains(@class, "todo-count")]/strong    1
    Close All Browsers
