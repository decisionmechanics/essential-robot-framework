*** Settings ***
Documentation       Test suite

Resource            ../resources/axe.resource


*** Test Cases ***
Perform A11y Checks
    [Documentation]    Perform accessibility checks
    Open Browser    https://todomvc.com/examples/javascript-es6/dist/    Edge
    Wait Until Element Is Enabled    css=.new-todo
    Inject Axe
    Run Axe And Fail If Violations    .todoapp    .learn
