*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:7272/Lab12/Registration.html
${BROWSER}        firefox
${SUCCESS_URL}    http://localhost:7272/Lab12/Success.html
${FIRST_NAME}      Somsri
${Organization}    CS KKU
${EMAIL}          somsri@kkumail.com
${PHONE_NO}       081-001-1234
${ERORR}          Please enter your last name!!

*** Test Cases ***
Register and Verify Success Page
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=organization    ${Organization}
    Input Text    id=email    ${EMAIL}
    Input Text    id=phone    ${PHONE_NO}
    Click Button    id=registerButton
    Wait Until Element Is Visible    id=errors
    Element Text Should Be    id=errors    ${ERORR} 
    Close    Browser    
