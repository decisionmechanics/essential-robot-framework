*** Settings ***
Documentation       Test suite


*** Variables ***
${BROWSER}      Firefox


*** Test Cases ***
Compare Environment And Robot Variables
    [Documentation]    Log both Robot Framework variable ${BROWSER} and environment variable %{BROWSER}
    Log    Robot Framework variable: ${BROWSER}
    Log    Environment variable: %{BROWSER}
