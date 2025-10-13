*** Settings ***
Documentation       Test suite

Library             RequestsLibrary


*** Variables ***
${URL}=             https://restful-booker.herokuapp.com/booking
${FIRST_NAME}=      Jane
${LAST_NAME}=       Doe
${PRICE}=           150


*** Test Cases ***
Create And Confirm Booking
    [Documentation]    Create and confirm a booking
    ${booking_id}=    Create Booking
    Log    Booking ID: ${booking_id}
    ${booking}=    Get Booking    ${booking_id}
    Should Be Equal    ${booking}[lastname]    ${LAST_NAME}
    Should Be Equal    ${booking}[firstname]    ${FIRST_NAME}
    Should Be Equal As Numbers    ${booking}[totalprice]    ${PRICE}


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
    ${response}=    POST    url=https://restful-booker.herokuapp.com/booking    json=${body}
    VAR    ${booking_id}=    ${response.json()}[bookingid]
    RETURN    ${booking_id}

Get Booking
    [Documentation]    Get a booking
    [Arguments]    ${booking_id}
    ${response}=    GET    ${URL}/${booking_id}
    RETURN    ${response.json()}
