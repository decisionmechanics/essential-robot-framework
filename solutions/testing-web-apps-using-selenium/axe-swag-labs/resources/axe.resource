*** Settings ***
Documentation       Axe keywords

Library             Collections
Library             OperatingSystem
Library             SeleniumLibrary


*** Variables ***
${AXE_JS}       https://cdnjs.cloudflare.com/ajax/libs/axe-core/4.9.1/axe.min.js


*** Keywords ***
Log Into App
    [Documentation]    Log into Swag Labs web app
    Open Browser    https://saucedemo.com    Edge
    Wait Until Element Is Enabled    id=login-button
    Input Text    id=user-name    standard_user
    Input Password    id=password    secret_sauce
    Click Button    id=login-button
    Wait Until Element Is Enabled    css=[data-test='inventory-container']

Inject Axe
    [Documentation]    Inject Axe JavaScript library
    Execute Async JavaScript
    ...    var done = arguments[0];
    ...    if (window.axe) { return done(); }
    ...    var s = document.createElement('script');
    ...    s.src = '${AXE_JS}';
    ...    s.onload = function(){ done(); };
    ...    document.head.appendChild(s);

Run Axe And Fail If Violations
    [Documentation]    Perform checks using Axe
    [Arguments]    ${include_locator}=None    ${exclude_locator}=None
    ${result}=    Execute Async JavaScript
    ...    var done=arguments[0];
    ...    window.axe.run({
    ...    include: "${include_locator}" !== "None" ? "${include_locator}" : undefined,
    ...    exclude: "${exclude_locator}" !== "None" ? "${exclude_locator}" : undefined,
    ...    }).then(done);
    ${violations}=    Get From Dictionary    ${result}    violations
    ${count}=    Get Length    ${violations}
    Log    Found ${count} a11y violations
    Should Be Equal As Integers    ${count}    0    msg=Accessibility issues:\n${violations}
