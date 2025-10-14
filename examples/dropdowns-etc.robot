*** Settings ***
Documentation       Real-world UI tests against the-internet.herokuapp.com using Robot Framework Browser

Library             Browser

Test Setup          New Browser    chromium    headless=True
Test Teardown       Close Browser    ALL


*** Variables ***
${BASE}     https://the-internet.herokuapp.com


*** Test Cases ***
Select From Dropdown
    [Documentation]    Verify selecting an option from the dropdown sets the correct value.
    New Page    ${BASE}/dropdown
    Select Options By    css=#dropdown    text    Option 2
    ${selected}=    Get Selected Options    css=#dropdown
    Should Be Equal As Strings    ${selected}[0]    Option 2

Toggle Checkboxes
    [Documentation]    Verify checking and unchecking a checkbox updates its state correctly.
    New Page    ${BASE}/checkboxes
    Check Checkbox    css=#checkboxes input >> nth=0
    ${is_checked}=    Is Checked    css=#checkboxes input >> nth=0
    Should Be True    ${is_checked}
    Uncheck Checkbox    css=#checkboxes input >> nth=0
    ${is_checked}=    Is Checked    css=#checkboxes input >> nth=0
    Should Not Be True    ${is_checked}

Remove And Add Checkbox
    [Documentation]    Verify removing and adding a checkbox updates the DOM and shows status messages
    New Page    ${BASE}/dynamic_controls
    Click    css=#checkbox-example button
    Get Text    css=#message    ==    It's gone!
    Click    css=#checkbox-example button
    Get Text    css=#message    ==    It's back!

Reveal Caption On Hover
    [Documentation]    Verify hovering over a figure reveals the caption text.
    New Page    ${BASE}/hovers
    Hover    css=.figure >> nth=0
    Get Text    css=.figure >> nth=0 >> css=.figcaption h5    *=    name:

Add/Remove Elements
    [Documentation]    Verify dynamically adding and removing elements updates the count correctly.
    New Page    ${BASE}/add_remove_elements/
    Click    css=button[onclick="addElement()"]
    Click    css=button[onclick="addElement()"]
    Click    css=button[onclick="addElement()"]
    ${buttons}=    Get Element Count    css=.added-manually
    Should Be Equal As Integers    ${buttons}    3
    Click    css=.added-manually >> nth=0
    ${buttons}=    Get Element Count    css=.added-manually
    Should Be Equal As Integers    ${buttons}    2


*** Keywords ***
Is Checked
    [Documentation]    Get the checked status of an element
    [Arguments]    ${locator}
    # Ensure the element exists before reading its property
    Wait For Elements State    ${locator}    attached    timeout=5s
    ${checked}=    Get Property    ${locator}    checked
    RETURN    ${checked}
