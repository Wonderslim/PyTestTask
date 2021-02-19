*** Settings ***
Library  SeleniumLibrary
Resource  Resources/Utils.robot
Resource  Pages/PdfPage.robot

*** Variables ***
${photosDiv}    //body/div[@id='root']/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]
${photos}       //body/div[@id='root']/div[2]/div[1]/div[1]/div[1]/descendant::div[starts-with(@class,'MuiBox-root')]
${reportLink}   //body/div[@id='root']/div[2]/div[1]/div[4]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[2]/a[1]
${vin}          //div[contains(text(),'*********')]
${pattern}      [0-9A-Z]{4}[*]{13}

*** Keywords ***
Check Photos
    Wait Until Page Contains Element    ${photosDiv}
    ${photoList}=     Get WebElements      ${photos}
    ${length}=      Get Length      ${photoList}
    # Я понимаю что это честно говоря говнокод, но я написал его так потому что не смог сообразить как мне найти элемент у которого атрибут
    # бэкграунд имэйдж не налл, в силу того что я очень много времени убил на этот конкретно таск я решил пойти обходным путем
    # это максимум что я смог сделать - мы досатем все дивы содержащие фотки, таких дивов приходится 8 на 6 фотографий
    #(Так как некоторые из этих дивов это комплексные дивы содержащие из 2 фото например) проверяем что дивов больше 2 и меньше 9
    Should Be True      ${length}>2
    Should be True      ${length}<9

Check Vin
     Wait Until Element Is Visible   ${vin}
     ${vinElement}=    Get WebElement     ${vin}
     Should Match Regexp    ${vinElement.text}       ${pattern}

Open PDF
    Wait Until Page Contains Element   ${reportLink}
    ${link}=    Get WebElement  ${reportLink}
    ${linkAddress}=     Get Element Attribute   ${link}     href
    PdfPage.Download PDF    ${linkAddress}
