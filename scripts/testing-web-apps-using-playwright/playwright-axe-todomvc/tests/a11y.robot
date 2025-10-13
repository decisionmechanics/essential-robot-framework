*** Settings ***
Documentation       Test suite

Library             Browser
Resource            ../resources/axe.resource


*** Test Cases ***
Perform A11y Checks
    [Documentation]    Perform accessibility checks
    New Browser    chromium    headless=false    channel=msedge
    New Page    https://todomvc.com/examples/javascript-es6/dist/
    Wait For Elements State    .new-todo    enabled
    Inject Axe
    Run Axe And Fail If Violations    .todoapp    .learn
