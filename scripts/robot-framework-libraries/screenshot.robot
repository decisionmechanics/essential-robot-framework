*** Settings ***
Documentation       Test suite

Library             Screenshot
Library             SeleniumLibrary


*** Test Cases ***
Simple Screenshot Example
    [Documentation]    Opens a webpage and takes a screenshot

    Open Browser    https://robotframework.org    Edge
    Take Screenshot Without Embedding    robot-framework-homepage.jpeg
    Close Browser
