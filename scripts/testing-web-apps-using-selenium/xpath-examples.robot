*** Settings ***
Documentation       This is only for illustration

Library             SeleniumLibrary


*** Test Cases ***
XPath Syntax
    [Documentation]    Demonstrates common XPath functions and predicates with SeleniumLibrary
    # robocop: off=too-long-test-case

    Open Browser    https://example.com    Edge

    # contains() on an attribute — matches if class contains "submit"
    Click Button    xpath=//button[contains(@class, 'submit')]

    # contains(text()) — partial match on link text
    Click Link    xpath=//a[contains(text(), 'Sign')]

    # starts-with() — attribute begins with "user"
    Input Text    xpath=//input[starts-with(@name, 'user')]    Emiliana

    # position() — pick the 2nd text input on the page
    Input Text    xpath=(//input[@type='text'])[position()=2]    Hello World

    # last() — click the last row's action button in a table
    Click Element    xpath=(//table[@id='orders']//tr)[last()]//button

    # Combine conditions with and/or — text input named q OR search
    Input Text    xpath=//input[@type='text' and (@name='q' or @name='search')]    robot

    # Parent axis (..) — find a label, then act on its sibling input via the parent
    Click Element    xpath=//label[text()='Email']/../input

    # Current node (.) — scope a relative search from a known container
    # (Example: within a specific card div, find its first button)
    Click Element    xpath=//div[@class='card'][1]/.//button[1]

    Close Browser

    # robocop: on
