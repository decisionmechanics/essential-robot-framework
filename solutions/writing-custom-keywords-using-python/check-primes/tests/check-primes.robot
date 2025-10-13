*** Settings ***
Documentation       Test suite

Library             ../libraries/primes.py


*** Test Cases ***
Assert That 2 Is Prime
    [Documentation]    Confirm that 2 is a prime number

    Should Be Prime    2

Assert That 3 Is Prime
    [Documentation]    Confirm that 3 is a prime number

    Should Be Prime    3

Assert That 9 Is Not Prime
    [Documentation]    Confirm that 9 is a prime number

    Run Keyword And Expect Error    9 is not a prime number    Should Be Prime    9

Assert That 7919 Is Prime
    [Documentation]    Confirm that 7919 is a prime number

    Should Be Prime    7919
