*** Settings ***
Library    SeleniumLibrary
Library    ../CustomLibrary/BlogSpot.py
Library    DataDriver

*** Keywords ***

*** Variables ***
${url}      https://testautomationpractice.blogspot.com/
${browser}  CHROME

*** Test Cases ***
Validate the page
#    create webdriver
    open browser            ${url}       ${browser}
    maximize browser window
#    set selenium speed    1
    input text              id:name       Pradeep
    input text              id:email      pradeepramola162@gmail.com
    input text              id:phone      8888888888
    input text              id:textarea   Delhi, India, 201100
    select radio button     gender        male
    select checkbox         id:tuesday
    select checkbox         id:monday
    select from list by label    id:country     India
    select from list by value    id:colors      red     green
    click element    id:datepicker
    # validating the alert box
    click button    xpath://button[text()='Alert']
    handle alert    ACCEPT
    click button    xpath://button[text()='Confirm Box']
    alert should be present     Press a button!
    wait until page contains    You pressed OK!
#    alert should not be present
    click button    xpath://button[text()='Prompt']
    ${alert_text}=  set variable    Pradeep ramola
    input text into alert       ${alert_text}
    wait until page contains    Hello ${alert_text}! How are you today?
    # switch wondows validation
    click button                xpath://button[text()="New Browser Window"]
    switch window    NEW
    title should be    Your Store
    close window
    switch window    MAIN
    title should be    Automation Testing Practice
    sleep    1
    input text    xpath://input[starts-with(@id, "Wiki")]       Prince
    click element    css:.wikipedia-search-button
    sleep   2
    BlogSpot.click the men item       Prince
    BlogSpot.click all the men item

#    capture element screenshot     <locator>       <filepath>
#    capture page screenshot    <filepath>
    sleep    3
    execute javascript      window.scrollTo(0,document.body.scrollHeight)       #end of the page
    execute javascript      window.scrollTo(0,-document.body.scrollHeight)
