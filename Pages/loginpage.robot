*** Settings ***
Library     SeleniumLibrary




*** Keywords ***
Open Browser to Login Page
    open browser    https://opensource-demo.orangehrmlive.com/      Chrome
    maximize browser window
    set selenium implicit wait    10



Login with Valid credentials
    [Arguments]         ${username}         ${password}
    input text          name:username       ${username}
    input password      name:password       ${password}
    submit form
    sleep    3
    title should be    OrangeHRM   Incorrect title




Login with credentials
    [Arguments]         ${username}         ${password}
    ${user}     set variable        name:username
    element should be visible    ${user}
    element should be enabled    ${user}
    input text          name:username       ${username}
    input password      name:password       ${password}
    submit form
    sleep    3
    title should be    OrangeHRM   Incorrect title
    page should not contain     Invalid credentials
    close browser
    


