*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:7272/Lab12/Registration.html
${BROWSER}        firefox
${FIRST_NAME}     Somsri
${LAST_NAME}      Sodsai
${ORGANIZATION}   CS KKU
${EMAIL}          somsri@kkumail.com
${INVALID_PHONE}  1234
${ERROR_MESSAGE}  Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)

*** Test Cases ***
Register and Verify Invalid Phone Number Error
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname    ${LAST_NAME}
    Input Text    id=organization    ${ORGANIZATION}
    Input Text    id=email    ${EMAIL}
    Input Text    id=phone    ${INVALID_PHONE}
    Click Button    id=registerButton
    Wait Until Element Is Visible    id=errors
    Element Text Should Be    id=errors    ${ERROR_MESSAGE}
    Close Browser
