*** Settings ***
Documentation       Test suite


*** Variables ***
${USERNAME}         Jane
@{ANIMALS}          Cat    Dog    Hedgehog
&{CREDENTIALS}      user=admin    password=1234


*** Test Cases ***
Variable Types
    [Documentation]    Demonstrates scalar, list, dictionary, command-line and built-in variables

    # Scalar
    Log    Hello, ${USERNAME}!

    # List
    Log    First animal: ${ANIMALS}[0]
    Log    All animals: @{ANIMALS}

    # Dictionary
    Log    Login with user: ${CREDENTIALS.user} and password: ${CREDENTIALS.password}

    # Command line variable (e.g. run with: robot --variable BROWSER:chrome this_suite.robot)
    Log    Running tests in browser: ${BROWSER}

    # Built-in variables
    Log    Current directory: ${CURDIR}
    Log    Current test: ${TEST NAME}
