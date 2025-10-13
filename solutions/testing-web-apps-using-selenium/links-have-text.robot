*** Settings ***
Documentation       Test suite

Library             SeleniumLibrary

Suite Setup         Open Browser    ${URL}    Edge
Suite Teardown      Close All Browsers


*** Variables ***
${URL}      https://todomvc.com/examples/javascript-es6/dist/


*** Test Cases ***
Images Must Have Alt Text
    [Documentation]    Images must have alt text
    ${missing}=    Get Element Count    css=img:not([alt]), img[alt=""]
    Should Be Equal As Integers    ${missing}    0    msg=Found ${missing} <img> without usable alt

Form Inputs Must Have Labels
    [Documentation]    Form inputs must have labels
    ${unlabelled}=    Get Element Count    css=input:not([aria-label]):not([aria-labelledby])
    Should Be Equal As Integers    ${unlabelled}    0    msg=Found ${unlabelled} inputs without labels

Page Must Declare Language
    [Documentation]    Page must declare language
    ${lang}=    Get Element Attribute    css=html    lang
    Should Not Be Empty    ${lang}    msg=<html> is missing a lang attribute or it is empty

Links Must Have Text
    [Documentation]    Links must have text
    ${bad_links}=    Get Element Count    css=a:has(:empty):not([aria-label]):not([aria-labelledby])
    Should Be Equal As Integers    ${bad_links}    0    msg=Found ${bad_links} links without accessible text
