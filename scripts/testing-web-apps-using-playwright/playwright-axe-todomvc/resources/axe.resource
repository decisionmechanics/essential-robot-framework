*** Settings ***
Documentation       Axe keywords

Library             Collections
Library             OperatingSystem
Library             Browser


*** Variables ***
${AXE_JS}       https://cdnjs.cloudflare.com/ajax/libs/axe-core/4.9.1/axe.min.js


*** Keywords ***
Inject Axe
    [Documentation]    Inject Axe JavaScript library
    Evaluate Javascript    ${None}
    ...    async () => {
    ...    if (window.axe) return true;
    ...    await new Promise((resolve, reject) => {
    ...    const s = document.createElement('script');
    ...    s.src = '${AXE_JS}';
    ...    s.onload = () => resolve(true);
    ...    s.onerror = () => reject(new Error('axe load failed: ' + src));
    ...    document.head.appendChild(s);
    ...    });
    ...    return !!window.axe;
    ...    }

Run Axe And Fail If Violations
    [Documentation]    Perform checks using Axe
    [Arguments]    ${include_locator}=None    ${exclude_locator}=None
    ${result}=    Evaluate JavaScript    ${None}
    ...    async () => {
    ...    return await window.axe.run({
    ...    include: "${include_locator}" !== "None" ? "${include_locator}" : undefined,
    ...    exclude: "${exclude_locator}" !== "None" ? "${exclude_locator}" : undefined,
    ...    });
    ...    }
    ${violations}=    Get From Dictionary    ${result}    violations
    ${count}=    Get Length    ${violations}
    Log    Found ${count} a11y violations
    Should Be Equal As Integers    ${count}    0    msg=Accessibility issues:\n${violations}
