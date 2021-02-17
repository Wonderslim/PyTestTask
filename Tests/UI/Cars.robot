*** Settings ***
Library         SeleniumLibrary
Resource  Pages/CarsPage.robot
Resource  Pages/CarPage.robot
Resource  Pages/HomePage.robot
Resource  Resources/Utils.robot

Suite Setup  Utils.Start
Suite Teardown  Utils.Finish

*** Test Cases ***
Open auto page in chrome browser
    [Documentation]  1. Открыть в браузере страницу авто
    HomePage.Go to cars Page
    CarsPage.Click on first element
    CarPage.Open Photos
