*** Settings ***
Documentation       Test suite verifying JavaScript alert, confirm, and prompt handling using Browser library

Library             Browser

Test Setup          Open App
Test Teardown       Close Browser    ALL


*** Variables ***
${URL}                  https://the-internet.herokuapp.com/javascript_alerts
${RESULT_LOCATOR}       css=#result


*** Test Cases ***
Accept JS Alert
    [Documentation]    Verify that accepting a simple JavaScript alert displays the success message.
    Handle Future Dialogs    action=accept
    Click    text=Click for JS Alert
    # Wait For Elements State    ${RESULT_LOCATOR}    visible
    Get Text    ${RESULT_LOCATOR}    ==    You successfully clicked an alert

Accept JS Confirm
    [Documentation]    Verify that accepting a JS confirm dialog shows "You clicked: Ok".
    Handle Future Dialogs    action=accept
    Click    text=Click for JS Confirm
    # Wait For Elements State    ${RESULT_LOCATOR}    visible
    Get Text    ${RESULT_LOCATOR}    ==    You clicked: Ok

Dismiss JS Confirm
    [Documentation]    Verify that dismissing a JS confirm dialog shows "You clicked: Cancel".
    Handle Future Dialogs    action=dismiss
    Click    text=Click for JS Confirm
    # Wait For Elements State    ${RESULT_LOCATOR}    visible
    Get Text    ${RESULT_LOCATOR}    ==    You clicked: Cancel

Fill And Accept JS Prompt
    [Documentation]    Verify that entering text into a JS prompt and accepting shows the correct result.
    Handle Future Dialogs    action=accept    prompt_input=Hello from Robot
    Click    text=Click for JS Prompt
    # Wait For Elements State    ${RESULT_LOCATOR}    visible
    Get Text    ${RESULT_LOCATOR}    ==    You entered: Hello from Robot


*** Keywords ***
Open App
    [Documentation]    Open JavaScript alert application
    New Browser    chromium    headless=True
    New Page    ${URL}
