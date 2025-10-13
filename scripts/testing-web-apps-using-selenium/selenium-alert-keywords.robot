*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary


*** Test Cases ***
Handle An Alert
    [Documentation]    Close an alert dialog
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    browser=Edge
    Execute Javascript    alert('hello')
    Sleep    1s
    Handle Alert    ACCEPT
    Sleep    1s
    Close All Browsers
