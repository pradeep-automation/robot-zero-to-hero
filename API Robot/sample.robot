*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library    sample.py
Library     RequestsLibrary


*** Keywords ***

*** Variables ***

*** Test Cases ***
validate the lists equality
    @{l1}   create list    1    3   5   6
    @{l2}   create list    1    4  5   6
    @{l3}   create list    1    5   3   6
#    log to console    ${l1}[1]
    should be equal       ${l1}       ${l2}
    compare list    ${l1}   ${l3}
    get on session      url

