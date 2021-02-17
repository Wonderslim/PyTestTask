*** Settings ***
Library         SeleniumLibrary
Suite Teardown  Close Browser

*** Variables ***
${CARS}         //span[text()='Очистить']/parent::button/following-sibling::button
${FIRSTCAR}     //a[contains(@href,'/cars/') and starts-with(@class,'jss')]
${LOCATION}     https://sberauto.com/cars/

*** Test Cases ***
Open auto page in chrome browser
    [Documentation]  1. Открыть в браузере страницу авто

    Open Browser    https://sberauto.com  chrome
    Maximize Browser Window
    Click Element   ${CARS}
    Wait Until Page Contains Element   ${FIRSTCAR}
    Click Element   ${FIRSTCAR}

Check that page contains more than 1 photo and max 6
    [Documentation]  2. Проверить, что на странице отображаются 6 фото авто, если у машины 6 или больше фото,
    ...               или все фотографии, которые есть у машины. У каждой машины на Сберавто есть как минимум одно фото.



*** Keywords ***
