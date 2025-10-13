*** Settings ***
Documentation       Test suite

Library             RequestsLibrary


*** Variables ***
${BOOKING_ID}=      123


*** Test Cases ***
Delete Booking
    [Documentation]    Delete booking with given ID
    VAR    &{header}=    Cookie=token\=${None}
    DELETE
    ...    url=https://restful-booker.herokuapp.com/booking/${BOOKING_ID}
    ...    headers=${header}
    ...    expected_status=403
