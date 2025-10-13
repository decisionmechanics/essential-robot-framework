*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Keywords ***
Open App
    [Documentation]    Opens the TodoMVC React app in a Chrome browser and maximises the window.
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    Edge
    Maximize Browser Window

Add Todo
    [Documentation]    Adds a new todo item using the input field.
    [Arguments]    ${item}
    Input Text    css=.new-todo    ${item}
    Press Keys    css=.new-todo    RETURN
    Wait Until Element Is Visible    xpath=//label[text()="${item}"]

Todo Should Exist
    [Documentation]    Verifies that the given todo item is displayed in the list.
    [Arguments]    ${item}
    Page Should Contain Element    xpath=//label[text()="${item}"]

Complete Todo
    [Documentation]    Marks the specified todo item as completed.
    [Arguments]    ${item}
    Click Element    xpath=//label[text()="${item}"]/preceding-sibling::input[@class="toggle"]
    Wait Until Element Is Visible    //label[text()="${item}"]

Todo Should Be Completed
    [Documentation]    Checks that the specified todo item is marked as completed.
    [Arguments]    ${item}
    ${class}=    Get Element Attribute    //label[text()="${item}"]/../..    class
    Should Be Equal As Strings    ${class}    completed

Delete Todo
    [Documentation]    Deletes the specified todo item from the list.
    [Arguments]    ${item}
    Mouse Over    xpath=//label[text()="${item}"]
    Click Element    xpath=//label[text()="${item}"]/following-sibling::button[@class="destroy"]
    Wait Until Element Is Not Visible    xpath=//label[text()="${item}"]

Todo Should Not Exist
    [Documentation]    Verifies that the specified todo item is no longer visible.
    [Arguments]    ${item}
    Page Should Not Contain Element    xpath=//label[text()="${item}"]
