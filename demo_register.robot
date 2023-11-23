*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}      https://demowebshop.tricentis.com/register
${BROWSER}  chrome
# Registration page locators

*** Keywords ***
open the website
    open browser    ${URL}      ${BROWSER}
    maximize browser window
#    set selenium speed    3


*** Test Cases ***
validate the registration page
    open the website
    select radio button    Gender   M
    input text             FirstName        Test
    input text             LastName         User
    input text             Email            test.user007@testing.com
    input password         Password         Test123
    input password         ConfirmPassword  Test123
    click button           register-button
    sleep                   5
#    page should contain



