*** Settings ***
Documentation       Test suite

Library             Collections
Library             RequestsLibrary


*** Variables ***
${URL}              https://restful-booker.herokuapp.com/booking
${FIRST_NAME}       Jane
${LAST_NAME}        Doe
${PRICE}            150


*** Test Cases ***
Create Then Delete Booking
    [Documentation]    Create then delete a booking
    ${booking_id}=    Create Booking
    ${security_token}=    Authenticate As Admin
    Delete Booking    ${booking_id}    security_token=${security_token}


*** Keywords ***
Create Booking
    [Documentation]    Create a booking
    VAR    &{booking_dates}=    checkin=2025-12-24    checkout=2025-12-26
    VAR    &{body}=
    ...    firstname=${FIRST_NAME}
    ...    lastname=${LAST_NAME}
    ...    bookingdates=${booking_dates}
    ...    totalprice=${PRICE}
    ...    depositpaid=false
    ${response}=    POST    url=${URL}    json=${body}    expected_status=200
    VAR    ${booking_id}=    ${response.json()}[bookingid]
    RETURN    ${booking_id}

Delete Booking
    [Documentation]    Delete booking with given ID
    [Arguments]    ${booking_id}    ${security_token}
    VAR    &{header}=    Cookie=token\=${security_token}
    DELETE    url=${URL}/${booking_id}    headers=${header}    expected_status=201

Authenticate As Admin
    [Documentation]    Authenticate to allow admin-only operations
    VAR    &{body}=    username=admin    password=password123
    ${response}=    POST    url=https://restful-booker.herokuapp.com/auth    json=${body}
    VAR    ${token}=    ${response.json()}[token]
    RETURN    ${token}
