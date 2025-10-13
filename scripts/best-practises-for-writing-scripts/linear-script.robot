*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Add Multiple Todos
    [Documentation]    Open the TodoMVC app, add three todos and close the browser
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    Edge
    Maximize Browser Window
    Input Text    css=input.new-todo    Buy milk
    Press Keys    css=input.new-todo    RETURN
    Input Text    css=input.new-todo    Walk the dog
    Press Keys    css=input.new-todo    RETURN
    Input Text    css=input.new-todo    Read a book
    Press Keys    css=input.new-todo    RETURN
    Sleep    5s
    Close Browser
