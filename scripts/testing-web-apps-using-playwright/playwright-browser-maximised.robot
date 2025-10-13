*** Settings ***
Documentation       Test suite

Library             Browser


*** Test Cases ***
Browse To TodoMVC App
    [Documentation]    Browse to TodoMVC app
    New Browser    chromium    headless=false    channel=msedge    args=["--start-maximized"]
    New Context    viewport=${None}
    New Page    https://todomvc.com/examples/javascript-es6/dist/
    Sleep    3s
    Close Browser    ALL
