*** Settings ***
Documentation       Test suite


*** Test Cases ***
Display Message
    [Documentation]    Display a positive message
    Log    I ❤️ Robot Framework!

Display Complaint
    [Documentation]    Display a negative message
    Log    I 😠 Robot Framework!
