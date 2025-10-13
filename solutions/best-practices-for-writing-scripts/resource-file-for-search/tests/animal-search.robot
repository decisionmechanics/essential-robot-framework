*** Settings ***
Documentation       Test suite

Resource            ../resources/bing-app.resource


*** Test Cases ***
Open Bing And Search
    [Documentation]    Open Bing and search
    Browse To Bing
    Search For Item    hedgehog
    Wait For Results    hedgehog
    Wait For Review
    Close Browser
