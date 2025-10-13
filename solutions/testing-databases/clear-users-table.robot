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
${DBNAME}       test.db


*** Test Cases ***
Clear Users Table
    [Documentation]    Verify users table schema
    Create Table And Insert Data
    Check Row Count    SELECT * FROM users    ==    2
    Delete All Records    users
    Check Row Count    SELECT * FROM users    ==    0


*** Keywords ***
Create Table And Insert Data
    [Documentation]    Setup database and data
    Execute Sql String    CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)
    Execute Sql String    DELETE FROM users
    Execute Sql String    INSERT INTO users (name, age) VALUES ('Alice', 30)
    Execute Sql String    INSERT INTO users (name, age) VALUES ('Bob', 25)

Delete All Records
    [Documentation]    Delete all records in the table
    [Arguments]    ${table}
    Execute Sql String    DELETE FROM ${table}

Delete File If Exists
    [Documentation]    Delete file if it exists
    [Arguments]    ${file}
    ${exists}=    Run Keyword And Return Status    File Should Exist    ${file}
    IF    ${exists}    Remove File    ${file}
