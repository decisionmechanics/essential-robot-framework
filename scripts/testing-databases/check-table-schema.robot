*** Settings ***
Documentation       Test suite

Library             Collections
Library             OperatingSystem
Library             DatabaseLibrary

Suite Setup         Delete File If Exists    ${DBNAME}
Suite Teardown      Delete File If Exists    ${DBNAME}
Test Setup          Connect To Database    sqlite3    ${DBNAME}
Test Teardown       Disconnect From Database


*** Variables ***
${DBNAME}               test.db
@{EXPECTED_COLUMNS}     id    name    age


*** Test Cases ***
Verify Table Schema
    [Documentation]    Verify users table schema
    Create Table And Insert Data
    Verify Users Table Columns


*** Keywords ***
Create Table And Insert Data
    [Documentation]    Setup database and data
    Execute Sql String    CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)
    Execute Sql String    DELETE FROM users
    Execute Sql String    INSERT INTO users (name, age) VALUES ('Alice', 30)
    Execute Sql String    INSERT INTO users (name, age) VALUES ('Bob', 25)

Verify Users Table Columns
    [Documentation]    Verify users table columns match the expected schema
    ${columns}=    Query    PRAGMA table_info(users)

    ${actual_column_names}=    Create List    # robocop: off=replace-create-with-var

    FOR    ${row}    IN    @{columns}
        Append To List    ${actual_column_names}    ${row}[1]
    END

    Sorted Lists Should Be Equal    ${actual_column_names}    ${EXPECTED_COLUMNS}

Sorted Lists Should Be Equal
    [Documentation]    Check if two lists are equal, regardless of order
    [Arguments]    ${list1}    ${list2}
    ${list1_copy}=    Copy List    ${list1}
    Sort List    ${list1_copy}
    ${list2_copy}=    Copy List    ${list2}
    Sort List    ${list2_copy}
    Lists Should Be Equal    ${list1_copy}    ${list2_copy}

Delete File If Exists
    [Documentation]    Delete file if it exists
    [Arguments]    ${file}
    ${exists}=    Run Keyword And Return Status    File Should Exist    ${file}
    IF    ${exists}    Remove File    ${file}
