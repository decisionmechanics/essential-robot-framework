*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Add Todo Item Using Headless Edge
    [Documentation]    Add a todo item
    Open Headless Edge    https://todomvc.com/examples/javascript-es6/dist/
    Add Todo Item    Learn Robot Framework
    Close All Browsers

Add Todo Item Using Headless Chrome
    [Documentation]    Add a todo item
    Open Headless Chrome    https://todomvc.com/examples/javascript-es6/dist/
    Add Todo Item    Learn Robot Framework
    Close All Browsers


*** Keywords ***
Open Headless Edge
    [Documentation]    Open headless Edge
    [Arguments]    ${url}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Open Browser    ${url}    Edge    options=${options}

Open Headless Chrome
    [Documentation]    Open headless Chrome
    [Arguments]    ${url}
    Open Browser    ${url}    HeadlessChrome

Add Todo Item
    [Documentation]    Add todo item
    [Arguments]    ${item}
    Input Text    css=.new-todo    ${item}
    Press Keys    css=.new-todo    ENTER
