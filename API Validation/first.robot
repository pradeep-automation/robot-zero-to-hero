*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    RequestsLibrary
Library     JSONLibrary


*** Variables ***
${pet_id}

*** Keywords ***
create the session
    create session    my_url    url=https://petstore.swagger.io/v2

*** Test Cases ***
Validate the get request
        create the session
        &{param}       create dictionary    status=available
        ${resp}     GET ON SESSION    my_url    /pet/findByStatus     params=${param}
        ${json_data}    evaluate       ${resp.text}        # $..data
#        log to console    ${json_data}
        log to console    ${resp.json()}[0]
#        delete all sessions

validate the post request
        create the session
        ${payload}      load json from file     C:/Development/robot-scripts/robot-zero-to-hero/API Validation/pet.json
        ${response}     post on session    my_url       /pet    json=${payload}
        set suite variable     ${pet_id}             ${response.json()}[id]


validate the delete request
        create the session
        ${response}     delete on session    my_url      /pet/${pet_id}
        log to console    ${response}




