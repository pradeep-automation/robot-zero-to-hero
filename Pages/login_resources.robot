*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Invalid login
    [Arguments]    ${username}    ${password}
    Input username    ${username}
    Input pwd    ${password}
    click login button
    Error message should be visible

Open My Browser
    set selenium implicit wait    10
    open browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login      CHROME

Close Browsers
    close browser

Input username
    [Arguments]         ${user}
    input text          name:username         ${user}

Input pwd
    [Arguments]     ${pass}
    input password    name:password      ${pass}

click login button
    submit form
    sleep    2

Error message should be visible
    page should contain    Invalid credentials

