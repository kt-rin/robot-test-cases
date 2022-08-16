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


*** Test Cases***
Testcase 02 - Verify that user can login to the system when username are correct
    Open Website
    Enter Text    username    ${username}
    Enter Text    password    ${password}
    Click Element    id=loginbtn
    Wait Until Page Contains    ${textOnHomePage}







