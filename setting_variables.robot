*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${var1}     Hello world

*** Test Cases ***
firsttest
    ${var}      set variable    I am first test variable
    log to console    ${var}
    ${glbl}     set variable    I can be global
    set global variable     ${glbl}
    set global variable    ${glbl2}     I am also global
#    set global variable    ${glbl2}
    set local variable    @ls       item1   item2   item3
    log to console    ${ls}
    set global variable    @{ls}
    set test variable



secondtest
    ${var}      set variable    I am second test variable
    log to console    ${var}
    log to console    ${var1}
    log to console    ${glbl}
    log to console    ${glbl2}
    log to console    ${ls}




