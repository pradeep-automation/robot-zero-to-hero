*** Settings ***
Library    SeleniumLibrary
*** Test Cases ***
validate the multi selection list
    open browser    https://www.techlistic.com/p/selenium-practice-form.html      chrome
    maximize browser window
    set selenium implicit wait    10
    scroll element into view      css:#selenium_commands
    select all from list    css:#selenium_commands
    sleep    5

