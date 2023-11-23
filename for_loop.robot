*** Settings ***
Library    Collections
Library    SeleniumLibrary
Library     fortest.py

*** Test Cases ***
validate for loop
    FOR     ${i}    IN RANGE    1       10
    log to console    ${i}
    END

validate for loop all squares
    @{ls}    create list    1   2   3   4   5   6   7   8   9
    @{res}   create list
    FOR     ${i}    IN    @{ls}
    ${val}      evaluate    ${i} % 2
#    IF    ${val}==0         log to console    ${i}
    IF    ${val}==0         APPEND TO LIST    ${res}        ${i}
        END
    log to console    ${res}

validate the list of products
    [Tags]    sanity
    open browser    https://demowebshop.tricentis.com/computers     chrome
    maximize browser window
    set selenium implicit wait    10
    select item from    Accessories
#    select item    Notebooks
#    ${titles}       get webelements    css:h2[class='title']
#    FOR     ${title}    IN      @{titles}
#    ${var}      get text    ${title}
#    log to console    ${var}
#    log to console    ${title.text}
#    END
################################################

#    ${expected}     set variable    Notebooks
#    ${index}        SET VARIABLE    1
#    ${titles}       get webelements    css:h2[class='title']
#    FOR     ${title}        IN      @{titles}
#    ${var}      get text    ${title}
#    IF    "${expected}"== "${var}"
#
#    ${index}=    evaluate    ${index} + 1
#    BREAK
#    END
#    END
#    click element    xpath:(//h2[@class='title'])[${index}]
#    sleep    3