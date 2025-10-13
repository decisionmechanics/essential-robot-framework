*** Settings ***
Documentation       Test suite

Variables           ../libraries/variables.py


*** Test Cases ***
Use Variables From File
    [Documentation]    Demonstrate accessing variables imported from variables.py
    Log    Username: ${USERNAME}
    Log    Password: ${PASSWORD}
    Log    Animals: @{ANIMALS}
    Log    User from dict: ${CREDENTIALS}[user]
    Log    API URL: ${BASE_URL}/api
