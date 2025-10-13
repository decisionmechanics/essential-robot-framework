*** Settings ***
Documentation       Test suite

Resource            ../resources/axe.resource


*** Test Cases ***
Perform A11y Checks
    [Documentation]    Perform accessibility checks
    Log Into App
    Inject Axe
    Run Axe And Fail If Violations    include_locator=[data-test='inventory-container']
