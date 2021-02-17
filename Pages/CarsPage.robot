*** Variables ***
${FIRSTCAR}     //a[contains(@href,'/cars/') and starts-with(@class,'jss')]

*** Keywords ***
Click on first element
    Wait Until Page Contains Element   ${FIRSTCAR}
    Click Element   ${FIRSTCAR}
    ${handle}=  Switch Window   NEW     # Select latest opened window