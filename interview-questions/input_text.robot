*** Settings ***
Library    SeleniumLibrary
*** Variables ***

*** Keywords ***

*** Test Cases ***
Test input box
    open browser    https://demo.nopcommerce.com/   Chrome
    maximize browser window
    set selenium implicit wait    10seconds
    title should be    nopCommerce demo store
    ${search_box}   set variable    //input[@id='small-searchterms']
    set focus to element    ${search_box}
    input text    ${search_box}     phone
    press keys   ${search_box}       ENTER
    @{search_grid}      get webelements    css:.item-grid h2
    FOR     ${item}     IN      @{search_grid}
            log to console   ${item.text}
            IF      "${item.text}" == "Nokia Lumia 1020"
            click button    XPATH://button[text()='Add to cart']
            sleep    2
            BREAK
            END
    END
