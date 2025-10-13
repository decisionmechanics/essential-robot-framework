*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Capture A Screenshot
    [Documentation]    Capture a screenshot
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    browser=Edge
    Input Text    css=.new-todo    Learn Robot Framework
    Press Keys    css=.new-todo    ENTER
    Capture Page Screenshot
    Close All Browsers
