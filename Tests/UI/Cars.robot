*** Settings ***
###     Для корректного запуска тестов возможно придется поменять пути в пакете PdfPage так там необходимо точное совпадение
###     Используемые библиотеки - SeleniumLibrary, RESTinstance, DiffLibrary, OperatingSystem

Library  SeleniumLibrary

Resource  Pages/CarPage.robot
Resource  Pages/CarsPage.robot
Resource  Pages/HomePage.robot
Resource  Resources/Utils.robot

Suite Setup  Utils.Start
Suite Teardown  Utils.Finish

*** Test Cases ***
Open auto page in chrome browser
    [Documentation]  1. Открыть в браузере страницу авто
    HomePage.Go to cars Page
    CarsPage.Click on first element

Check Photos
    [Documentation]  2. Проверить, что на странице отображаются 6 фото авто, если у машины 6 или больше фото,
    ...                 или все фотографии, которые есть у машины. У каждой машины на Сберавто есть как минимум одно
    ...                 фото.
    CarPage.Check Photos

Check Vin
    [Documentation]  3. Проверить, что на странице отображается замаскированный VIN машины -
    ...                 открыты первые 4 символа, остальные символы замаскированы символом '*'
    CarPage.Check Vin

Compare PDF
    [Documentation]  4. В блоке "Независимый осмотр" можно открыть пример независимого отчета (pdf).
    ...                 Проверить, файл, который открывается по ссылке "Пример отчета", совпадает с эталонным.
    ...                 В качестве эталона использовать pdf, который доступен на сайте сейчас
    CarPage.Open PDF

