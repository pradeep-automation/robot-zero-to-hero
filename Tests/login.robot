*** Settings ***
Library    SeleniumLibrary
Resource    ../Pages/login_resources.robot
Library    DataDriver       ../Data/MyData.xlsx     sheet_name=Sheet1

Suite Setup    Open my Browser
Suite Teardown    Close Browsers
Test Template    Invalid login


*** Test Cases ***
Login using ${username} and ${password}     default     default

#Wrong user right pass
#Wrong user wrong pass

*** Keywords ***
Invalid login
    [Arguments]    ${username}    ${password}
    Input username    ${username}
    Input pwd    ${password}
    click login button
    page should contain    Invalid credentials



