*** Settings ***
Documentation       Real-world examples: dynamic loading + drag and drop with Robot Framework Browser

Library             Browser

Test Setup          New Browser    chromium    headless=False
Test Teardown       Close Browser    ALL


*** Variables ***
${BASE}     https://the-internet.herokuapp.com


*** Test Cases ***
Dynamic Loading Shows Hello World
    [Documentation]    Verify dynamic loading renders “Hello World!” after clicking Start.
    New Page    ${BASE}/dynamic_loading/2
    Click    css=#start button

    # Spinner appears; wait for final text
    Get Text    css=#finish    ==    Hello World!

Drag And Drop Swaps Columns
    [Documentation]    Drag A onto B and verify column headers swap.
    New Page    ${BASE}/drag_and_drop

    # Sanity check initial labels
    Get Text    css=#column-a header    ==    A
    Get Text    css=#column-b header    ==    B

    # Perform HTML5 drag & drop using Browser library
    Drag And Drop    css=#column-a    css=#column-b

    # Verify they swapped
    Get Text    css=#column-a header    ==    B
    Get Text    css=#column-b header    ==    A

    Take Screenshot    drag_and_drop_result.png
