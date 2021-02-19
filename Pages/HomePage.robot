*** Variables ***
${cars}         //span[text()='Очистить']/parent::button/following-sibling::button

*** Keywords ***
Go to cars Page
        Click Element   ${cars}
