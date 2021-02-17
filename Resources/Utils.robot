*** Settings ***
Documentation  Tears up, Tears down and other utility methods

*** Keywords ***
Start
    Open Browser    https://sberauto.com  chrome
    Maximize Browser Window

Finish
    Close Browser