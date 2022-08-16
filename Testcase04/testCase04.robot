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

Add One Item To Cart
    Click Element    xpath=//button[text()="Add To Cart"]
    Sleep    0.5


*** Test Cases***
Testcase 04 - Verify that add to cart function are working correctly
    Open Website
    Enter Text    username    ${username}
    Enter Text    password    ${password}
    Click Element    id=loginbtn
    Wait Until Page Contains    ${textOnHomePage}

Go First Product and Add One Item To Cart
    Click Element    xpath=//p//span[text()="Doppio CUP"]
    Add One Item To Cart
    Element Text Should Be    id:lblCartCount   1

Increase Five Items To Cart
    FOR    ${index}    IN RANGE    5
        Add One Item To Cart
    END
    Element Text Should Be    id:lblCartCount   6

Clear All Cart
    Mouse Over    xpath=//a//i[@class='fas fa-shopping-cart fa-2x']
    Wait Until Element Is Visible    xpath=//a//i[@class='fas fa-shopping-cart fa-2x']    1s
    Click Element    xpath=//button[text()="Clear All Cart"]
    Sleep    0.5
    Element Text Should Be    id:lblCartCount   0