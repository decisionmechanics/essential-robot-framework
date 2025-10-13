*** Settings ***
Documentation       Test suite

Library             OperatingSystem
Library             DatabaseLibrary

Suite Setup         Delete File If Exists    ${DBNAME}
Suite Teardown      Delete File If Exists    ${DBNAME}
Test Setup          Connect To Database    sqlite3    ${DBNAME}
Test Teardown       Disconnect From Database


*** Variables ***
${DBNAME}       test.db


*** Test Cases ***
Create Table And Insert Data
    [Documentation]    Setup database and data
    Connect To Database    sqlite3    ${DBNAME}
    Execute Sql String    CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)
    Execute Sql String    DELETE FROM users
    Execute Sql String    INSERT INTO users (name, age) VALUES ('Alice', 30)
    Execute Sql String    INSERT INTO users (name, age) VALUES ('Bob', 25)
    Disconnect From Database

Validate Data In Users Table
    [Documentation]    Check that expected data is in the database
    Connect To Database    sqlite3    ${DBNAME}
    ${rows}=    Query    SELECT name, age FROM users ORDER BY id
    Should Be Equal As Strings    ${rows[0][0]}    Alice
    Should Be Equal As Integers    ${rows[0][1]}    30
    Should Be Equal As Strings    ${rows[1][0]}    Bob
    Should Be Equal As Integers    ${rows[1][1]}    25
    Disconnect From Database


*** Keywords ***
Delete File If Exists
    [Documentation]    Delete file if it exists
    [Arguments]    ${file}
    ${exists}=    Run Keyword And Return Status    File Should Exist    ${file}
    IF    ${exists}    Remove File    ${file}
