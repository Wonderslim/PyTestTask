*** Variables ***
${ENDPOINT}     /searcher/getCars

*** Test Cases ***
Check UUID
    [Documentation]  Получаем список машин и uuid первой из списка
    ${result}=  post    https://api.sberauto.com${ENDPOINT}
    Should be Equal     ${result.status_code}   ${200}
    ${json}=        Set Variable    ${result.json()}
    ${results}=        Get From Dictionary     ${json["data"]}     results
    ${uuid}=           Get From dictionary     ${results[0]}    uuid
    Should not be equal     ${uuid}     null