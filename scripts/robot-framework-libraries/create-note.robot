*** Settings ***
Documentation       Test suite

Library             OperatingSystem


*** Test Cases ***
Quick File Example
    [Documentation]    Simple use of OperatingSystem keywords
    # Create a file with content
    Create File    ${CURDIR}/note.txt    Hello Robot Framework!

    # Verify it exists
    File Should Exist    ${CURDIR}/note.txt

    # Read and log its content
    ${content}=    Get File    ${CURDIR}/note.txt
    Log    File content: ${content}

    # Delete the file
    Remove File    ${CURDIR}/note.txt
    File Should Not Exist    ${CURDIR}/note.txt
