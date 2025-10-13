*** Settings ***
Documentation       Test suite

Library             Collections
Library             RequestsLibrary


*** Variables ***
${URL}=                         https://restful-booker.herokuapp.com/booking
${FIRST_NAME}=                  Jane
${LAST_NAME}=                   Doe
${CHECKIN}=                     2025-12-24
${CHECKOUT}=                    2025-12-26
${PRICE}=                       150
@{EXPECTED_BOOKING_KEYS}=       bookingdates    depositpaid    firstname    lastname    totalprice


*** Test Cases ***
Check For Information Leakage
    [Documentation]    Check that bookings don't leak information
    ${booking_id}=    Create Booking
    Log    Booking ID: ${booking_id}
    ${booking}=    Get Booking    ${booking_id}
    Log    ${booking}
    ${keys}=    Get Dictionary Keys    ${booking}    sort_keys=True
    Lists Should Be Equal    ${keys}    ${EXPECTED_BOOKING_KEYS}


*** Keywords ***
Create Booking
    [Documentation]    Create a booking
    VAR    &{booking_dates}=    checkin=${CHECKIN}    checkout=${CHECKOUT}
    VAR    &{body}=
    ...    firstname=${FIRST_NAME}
    ...    lastname=${LAST_NAME}
    ...    bookingdates=${booking_dates}
    ...    totalprice=${PRICE}
    ...    depositpaid=false
    ${response}=    POST    url=https://restful-booker.herokuapp.com/booking    json=${body}
    VAR    ${booking_id}=    ${response.json()}[bookingid]
    RETURN    ${booking_id}

Get Booking
    [Documentation]    Get a booking
    [Arguments]    ${booking_id}
    ${response}=    GET    ${URL}/${booking_id}
    RETURN    ${response.json()}
