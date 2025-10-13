*** Settings ***
Documentation       Test suite

Library             Browser


*** Test Cases ***
Open Page In Mobile Context
    [Documentation]    Open a page in a mobile phone context
    ${devices}=    Get Devices
    Log    Supported devices: &{devices}
    ${device}=    Get Device    iPhone 15
    New Browser    webkit    headless=false
    New Context    &{device}
    New Page    http://robotframework.org
    Sleep    3s
    Close Browser    ALL
