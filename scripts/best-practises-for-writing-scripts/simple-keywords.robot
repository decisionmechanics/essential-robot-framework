*** Settings ***
Documentation       Test suite


*** Test Cases ***
Login To Website
    [Documentation]    Login to example website
    Open Browser To Login Page
    Input Username And Password
    Submit Login Form
    Log    Close Browser


*** Keywords ***
Open Browser To Login Page
    [Documentation]    Open login page in Edge
    Log    Open https://example.com/login in Edge
    Log    Maximize browser window

Input Username And Password
    [Documentation]    Input username and password
    Log    Input user name into the text field
    Log    Input password into the text field

Submit Login Form
    [Documentation]    Submit the form
    Log    Click the login button
