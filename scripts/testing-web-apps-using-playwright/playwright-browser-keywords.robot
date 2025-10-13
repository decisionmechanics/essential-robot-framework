*** Settings ***
Documentation       Test suite

Library             Browser


*** Test Cases ***
Browse To TodoMVC App
    [Documentation]    Browse to TodoMVC app
    New Browser    chromium    headless=false    channel=msedge
    New Page    https://todomvc.com/examples/javascript-es6/dist/
    Close Browser    ALL
