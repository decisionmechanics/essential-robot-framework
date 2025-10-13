*** Settings ***
Documentation       Automated tests for the TodoMVC app

Resource            ../resources/tags.resource

Suite Setup         Open App
Suite Teardown      Close Browser


*** Test Cases ***
Add Single Todo
    [Documentation]    Verify that a new todo item can be added successfully.
    [Tags]    smoke    add
    Add Todo    Buy milk
    Todo Should Exist    Buy milk

Complete Todo
    [Documentation]    Verify that an existing todo can be marked as completed.
    [Tags]    regression    complete
    Add Todo    Read book
    Complete Todo    Read book
    Todo Should Be Completed    Read book

Delete Todo
    [Documentation]    Verify that a todo item can be deleted from the list.
    [Tags]    regression    delete
    Add Todo    Walk dog
    Delete Todo    Walk dog
    Todo Should Not Exist    Walk dog
