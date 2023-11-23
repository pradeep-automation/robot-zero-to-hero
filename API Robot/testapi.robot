*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
*** Keywords ***

*** Variables ***
${petid}

*** Test Cases ***
validate the dictionary
    &{user}     create dictionary    name=pradeep       age=34      job=QA
    FOR    ${k}     ${v}     IN      &{user}
    log to console    ${k}
    log to console    ${v}
    END
    log to console    ${user}
    dictionary should contain key    ${user}    name       Key not found
    should be equal as integers    ${user}[age]         34       not fair


validate the get request
#    &{param}        create dictionary       username=rambo
    ${resp}         GET             https://petstore.swagger.io/v2/user/rambo       expected_status=404
    log to console    ${resp.json()}

validate the post request
    [Tags]                post
    ${my_json}            load json from file         API Robot/pet.json
    ${resp}                POST        https://petstore.swagger.io/v2/pet    json=${my_json}
    log to console          ${resp.json()}
    set global variable      ${petid}              ${resp.json()}[id]

validate the get request
    [Tags]          get
    ${resp}         GET                      https://petstore.swagger.io/v2/pet/${petid}
    log to console      ${resp.url}
    log to console      ${resp.json()}[name]

validate the delete request
    [Tags]    delete
    ${resp}         DELETE    https://petstore.swagger.io/v2/pet/${petid}
    log to console    ${resp.status_code}


Validate the vetsource get request
    ${headers}      create dictionary       Authorization=token cd61f441132925ff42be888217818e6d506baa02
    ${resp}         GET             https://vet-qa.membership-nonprod.petco.com/v1/practice/10035849        headers=${headers}
    log to console    ${resp.json()}[data][name]

validate the basic authentication
    log to console    ${CURDIR}
    [Tags]    my
    ${basicauth}=        create list        user        pass
    ${mytuple}          evaluate    tuple(${basicauth})
    log to console    ${mytuple}
    create session          my_url      https://httpbin.org/
    ${resp}         GET ON SESSION     my_url            /basic-auth/user/pass          auth=${mytuple}
    log to console      ${resp.json()}



