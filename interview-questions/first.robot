*** Settings ***
Library    SeleniumLibrary



*** Keywords ***

*** Variables ***


*** Test Cases ***
First test
    set suite variable      ${myvar}      HAHAHAHA
    log to console    pradeep
    log to console    Suite Variable: ${myvar}
    ${global}          evaluate    1+1
    set global variable    ${global}

Second Test
    &{d}    create dictionary    name=foo   job=bar

    log to console    ${d}[name]
    log to console      ${myvar}
    log to console      ${global}

