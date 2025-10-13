*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Add Three Todos To TodoMVC With Absolute XPaths
    [Documentation]    Opens the TodoMVC ES6 app and adds three todos using absolute XPath locators
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    Edge
    Wait Until Element Is Visible    xpath=/html/body/section/header/input

    Add Todo    Buy milk
    Add Todo    Walk dog
    Add Todo    Read book

    Wait Until Element Is Visible    xpath=/html/body/section/main/ul/li

    ${count}=    Get Element Count    xpath=/html/body/section/main/ul/li
    Should Be Equal As Integers    ${count}    3

    Close Browser


*** Keywords ***
Add Todo
    [Documentation]    Add todo
    [Arguments]    ${item}
    Input Text    xpath=/html/body/section/header/input    ${item}
    Press Keys    xpath=/html/body/section/header/input    RETURN
