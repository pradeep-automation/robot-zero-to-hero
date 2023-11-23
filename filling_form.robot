*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Keywords ***

*** Test Cases ***
fill the form and submit it
    open browser            https://qavalidation.com/demo-form/     chrome
    maximize browser window
    set selenium implicit wait    10
    input text              g4072-fullname        Tester Singh
    input text              g4072-email           tester.singh@email.com
    select radio button     g4072-yearsofexperience     5
    select checkbox         xpath:(//input[@type='checkbox'])[2]
    click button            xpath://button[text()='Submit!']
    page should contain     Your message has been sent
#    select from list by label
