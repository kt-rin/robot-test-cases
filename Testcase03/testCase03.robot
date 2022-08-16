*** Settings ***
Library    Selenium2Library


*** Variables ***
${browser}    chrome
${url}    http://125.26.15.143:13132/
${username}    oz4899
${password}    1234
${textOnHomePage}    Products


*** Keywords ***
Open Website
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Enter Text
    [Arguments]    ${locatorId}    ${InputText}
    Input Text    id=${locatorId}    ${InputText}
    Sleep    0.5

Enter Text and Search 
    [Arguments]    ${locatorId}    ${InputText}    ${searchBtnId}
    Input Text    id=${locatorId}    ${InputText}
    Sleep    0.5
    Click Element    id=${searchBtnId}


*** Test Cases***
Testcase 03 - Verify that search function are working correctly
    Open Website
    Enter Text    username    ${username}
    Enter Text    password    ${password}
    Click Element    id=loginbtn
    Wait Until Page Contains    ${textOnHomePage}

Invalid Search and Check If Search Not Found
    Enter Text and Search    keyword    abcd    searchbtn
    Element Text Should Be    id:notFound    No results found.

Valid Search and Check If Search Found
    Enter Text and Search     keyword     Shirt    searchbtn
    Wait Until Page Contains    Doppio Shirt







