*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
#for loop validation
#    @{my_list}      create list    apple    banana      orange      cherry
#
#    FOR    ${i}    IN     @{my_list}
#            IF    '${i}'=='banana'    BREAK
#            log to console    ${i}
#
#    END

#for loop validation
#    @{my_list}      create list    apple    banana      orange      cherry
#    FOR    ${i}    IN     @{my_list}
##            log to console    ${i}
#            IF    '${i}'=='banana'    CONTINUE
#            log to console    ${i}
#    END
#

count the links
    open browser    https://testautomationpractice.blogspot.com/        CHROME
    ${rows}     get element count    xpath://table[@name='BookTable']//tr
    ${cols}     get element count    xpath://table[@name='BookTable']//tr[1]//th
    log to console    ${rows}
    log to console    ${cols}
    sleep    3
    table column should contain    xpath://table[@name='BookTable']//tr[1]//th      2      Author
    FOR    ${i}     IN RANGE    1   ${rows}+1
        FOR    ${j}     IN RANGE    1       ${cols}+1
            ${value}    get table cell      xpath://table[@name='BookTable']     ${i}    ${j}
            log to console    ${value}
        END
    END


#    @{links}        get webelements    tag:a
#    FOR     ${link}     IN      @{links}
#        ${var}      get text    ${link}
#        ${var1}     get element attribute   ${link}     href
#        log to console      ${var1}
#    END
#    @{links}    get all links
#    FOR     ${link}     IN      @{links}
#
#        ${var1}     get element attribute   ${link}     href
#        log to console      ${var1}
#    END
#

