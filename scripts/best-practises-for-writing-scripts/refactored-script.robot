*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Add Multiple Todos
    [Documentation]    Open the TodoMVC app, add three todos using keywords and close the browser
    Open TodoMVC App
    Add Todo Buy Milk
    Add Todo Walk Dog
    Add Todo Read Book
    Wait For Review
    Close TodoMVC App


*** Keywords ***
Open TodoMVC App
    [Documentation]    Open the TodoMVC app in Edge and maximise the browser window
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    Edge
    Maximize Browser Window

Add Todo Buy Milk
    [Documentation]    Add the todo item "Buy milk" to the list
    Input Text    css=input.new-todo    Buy milk
    Press Keys    css=input.new-todo    RETURN

Add Todo Walk Dog
    [Documentation]    Add the todo item "Walk the dog" to the list
    Input Text    css=input.new-todo    Walk the dog
    Press Keys    css=input.new-todo    RETURN

Add Todo Read Book
    [Documentation]    Add the todo item "Read a book" to the list
    Input Text    css=input.new-todo    Read a book
    Press Keys    css=input.new-todo    RETURN

Wait For Review
    [Documentation]    Pause to allow the todos to be seen
    Sleep    5s

Close TodoMVC App
    [Documentation]    Close the browser to finish the test
    Close Browser
