*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           DiffLibrary

*** Variables ***
${Directory}      C:\\Users\\Wolle\\Documents\\PyTestTask\\Resources\\0cb82a7bd2a54f3eb2f224781751c7bc.pdf
${Template}         \\0cb82a7bd2a54f3eb2f224781751c7bc.pdf

*** Keywords ***
Download PDF
    [Arguments]   ${neededLink}
    Click Link    ${neededLink}
    Sleep   5
    Diff Files    ${Directory}  ${DIR}${Template}