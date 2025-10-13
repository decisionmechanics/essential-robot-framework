*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Browse To TodoMVC App
    [Documentation]    Browse to TodoMVC app
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    browser=Edge
    Close All Browsers
