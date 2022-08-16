*** Settings ***
Library    Selenium2Library				     


*** Variables ***
${browser}      chrome
${url}    http://125.26.15.143:13132/		
${username}     helloworld      
${password}     1234		


*** Keywords ***
Open Website
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Enter Text and Delay
    [Arguments]     ${locatorId}       ${InputText}
    Input Text    id=${locatorId}   ${InputText}
    Sleep    0.5


*** Test Cases***
Testcase 01 - Verify that user cannot login with wrong username
    Open Website
    Enter Text and Delay    username    ${username}
    Enter Text and Delay    password    ${password}
    Click Element    id=loginbtn
    ${message} =  Handle Alert
    Should Be Equal    ${message}    login failed








