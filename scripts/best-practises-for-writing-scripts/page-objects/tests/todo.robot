*** Settings ***
Documentation       Test suite

Resource            ../resources/common.resource
Resource            ../resources/todo-app.resource


*** Test Cases ***
Add Multiple Todos
    [Documentation]    Open the TodoMVC app, add three todos using keywords and close the browser
    Open App    https://todomvc.com/examples/javascript-es6/dist/    Edge
    todo-app.Add Todo    Buy milk
    todo-app.Add Todo    Walk dog
    todo-app.Add Todo    Read book
    Wait For Review    5s
    Close App
