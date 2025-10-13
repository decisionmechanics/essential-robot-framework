*** Settings ***
Documentation       This is only for illustration

Library             SeleniumLibrary


*** Test Cases ***
Example Locators
    [Documentation]    Demonstrates using different web locators with SeleniumLibrary
    Open Browser    https://example.com    Edge
    Input Text    id=username    Jane
    Input Text    name=email    jane@example.com
    Click Element    class=btn-primary
    Click Link    link=Login
    Click Link    partial link=Sign
    Input Text    css=input[type='password']    mySecret123
    Click Button    xpath=//button[@type='submit']
    Close Browser
