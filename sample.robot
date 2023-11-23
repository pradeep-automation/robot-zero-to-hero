*** Settings ***
Library     SeleniumLibrary
Test Setup   Open Herokuapp Application
Library    DataDriver       file=users.xlsx     sheet_name=Sheet1
#Test Template    Validate login form authentication

*** Variables ***
${URL}              https://the-internet.herokuapp.com/
${BROWSER}          CHROME

# Authentication form related variables
${user}             tomsmith
${pass}             SuperSecretPassword!
${login_xpath}      xpath://a[@href='/login']
${user_input_css}   css:#username
${pass_input_css}   css:#password

*** Keywords ***
open herokuapp application
    open browser    ${URL}      ${BROWSER}
    maximize browser window
    set selenium implicit wait    10
#    click element    ${login_xpath}

open authentication form and submit the credentials
    [Arguments]    ${username}      ${password}
    click element    ${login_xpath}
    input text       ${user_input_css}      ${username}
    input password    ${pass_input_css}     ${password}
    submit form

Validate login form authentication
    [Arguments]    ${usr}       ${pwd}
    open authentication form and submit the credentials     ${usr}     ${pwd}
#    page should contain    You logged into a secure area!
    sleep    4
    capture page screenshot

#*** Test Cases ***          usr        pwd
#Invalid user                pradeep     SuperSecretPassword!
#Invalid password            tomsmith    tetwwi
#Invalid credentials         xyz         xyz!

*** Test Cases ***
#Login with ${usr} and ${pwd}



validate various alert boxes
    [Tags]    smoke
    click link                  xpath://a[@href="/javascript_alerts"]
    click element               css:ul>li:nth-child(1) button
    handle alert                ACCEPT
    sleep                       2
    page should contain         You successfully clicked an alert
    click element               css:ul>li:nth-child(2) button
    alert should be present     I am a JS Confirm   DISMISS
    sleep                       2
    page should contain         You clicked: Cancel
    click element               css:ul>li:nth-child(3) button
    input text into alert       Pradeep Ramola     ACCEPT
    page should contain         You entered: Pradeep Ramola
    sleep                       2
    switch browser


validate frames
    [Tags]                      frames
    click link                  xpath://a[@href="/frames"]
    click link                  xpath://a[@href="/nested_frames"]
    select frame                frame-top
    select frame                frame-middle
    ${middleframe}              get text                                content
    log to console              ${middleframe}
    unselect frame
    select frame                frame-top
    select frame                frame-right
    ${rightframe}               get text                                tag:body
    log to console              ${rightframe}


validate multiple windows
    [Tags]    windows
    click link                  xpath://a[@href="/windows"]
    click link                  Click Here
    switch window               NEW
    ${new_text}                 get text            //h3
    log to console              ${new_text}
#    get location
#    go back
#    go to
#     double click element
#     open context menu
#     drag and drop by offset

validate javascript commands
    open browser    https://demowebshop.tricentis.com/books     ${browser}
    execute javascript      window.scrollTo(0, document.body.scrollHeight)
#    scroll element into view











