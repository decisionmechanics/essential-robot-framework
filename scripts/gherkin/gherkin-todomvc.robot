*** Comments ***
# robocop: off=wrong-case-in-keyword-name


*** Settings ***
Documentation       Example Robot Framework suite using Gherkin-style syntax to test the TodoMVC app.

Library             SeleniumLibrary

Suite Setup         Open Browser To TodoMVC
Suite Teardown      Close Browser


*** Variables ***
${URL}      https://todomvc.com/examples/javascript-es6/dist/


*** Test Cases ***
Add and complete a todo
    [Documentation]    Verifies that a user can add todos, mark them as complete, and view them through filters.
    Given the TodoMVC app is open
    When I add a todo "Buy milk"
    And I add a todo "Walk dog"
    Then the list should contain items    Buy milk    Walk dog
    When I toggle the todo "Buy milk"
    Then the "Completed" filter shows items    Buy milk
    And the "Active" filter shows items    Walk dog


*** Keywords ***
Open Browser To TodoMVC
    [Documentation]    Opens the TodoMVC application in a Chrome browser and waits until the input field is ready.
    Open Browser    ${URL}    Edge
    Maximize Browser Window
    Wait Until Element Is Visible    css=.new-todo    10s

the TodoMVC app is open
    [Documentation]    Placeholder for Gherkin readability; ensures the app is open and ready.
    No Operation

I add a todo "${text}"
    [Documentation]    Adds a new todo item by typing into the input field and pressing Enter.
    Input Text    css=.new-todo    ${text}
    Press Keys    css=.new-todo    RETURN

the list should contain items
    [Documentation]    Confirms that the given items are visible in the todo list.
    [Arguments]    @{items}
    FOR    ${item}    IN    @{items}
        Page Should Contain Element    xpath=//label[normalize-space(.)="${item}"]
    END

I toggle the todo "${text}"
    [Documentation]    Toggles a specific todo item as completed or active by clicking its checkbox.
    Click Element    xpath=//label[normalize-space(.)="${text}"]/../input[@class="toggle"]

the "${filter}" filter shows items
    [Documentation]    Clicks on the specified filter (All, Active, Completed) and verifies which items are visible.
    [Arguments]    @{items}
    Click Element    xpath=//a[.="${filter}"]
    Wait Until Page Contains Element    css=.todo-list li
    FOR    ${item}    IN    @{items}
        Page Should Contain Element    xpath=//li[not(contains(@class,"hidden"))]//label[normalize-space(.)="${item}"]
    END

# robocop: on
