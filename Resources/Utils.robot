*** Settings ***
Documentation  Tears up, Tears down and other utility methods
Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${DIR}
*** Keywords ***
Start
    ${now}    Get Time    epoch
    ${DIR}    Join Path    ${OUTPUT DIR}    downloads_${now}
    Create Directory    ${DIR}
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}=    Create Dictionary    download.default_directory=${DIR}   plugins.always_open_pdf_externally=${TRUE}
    Call Method    ${chrome options}    add_experimental_option    prefs    ${prefs}
    Set Global Variable     ${DIR}      ${DIR}
    Create Webdriver    Chrome    chrome_options=${chrome options}
    Goto   https://sberauto.com
    Maximize Browser Window

Finish
    Close Browser
