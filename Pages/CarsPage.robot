*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${firstcar}     //a[contains(@href,'/cars/') and starts-with(@class,'jss')]

*** Keywords ***
Click on first element
    Wait Until Page Contains Element   ${firstcar}
    ${carId}=    Get Element Attribute  ${firstcar}     href
    Click Element   ${firstcar}
    Switch Window   url=${carId}
