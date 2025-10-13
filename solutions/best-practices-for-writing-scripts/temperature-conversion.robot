*** Settings ***
Documentation       Test suite


*** Test Cases ***
Get Freezing Point
    [Documentation]    Get freezing point in Celcius
    ${freezing_point}=    Convert Fahrenheit To Celcius    32
    Log    Freezing point: ${freezing_point}

Get Boiling Point
    [Documentation]    Get boiling point in Celcius
    ${boiling_point}=    Convert Fahrenheit To Celcius    212
    Log    Boiling point: ${boiling_point}

Get Summer Day
    [Documentation]    Get summer day temperature in Celcius
    ${summer day}=    Convert Fahrenheit To Celcius    70
    Log    Summer day temperature: ${summer day}


*** Keywords ***
Convert Fahrenheit To Celcius
    [Documentation]    Calculates the Celcius equivalent of a Fahrenheit temperature
    [Arguments]    ${fahrenheit}
    ${celcius}=    Evaluate    (5/9) * (${fahrenheit} - 32)
    RETURN    ${celcius}
