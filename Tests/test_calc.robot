*** Settings ***
Library    ./calculator.py


*** Test Cases ***
Number should be added
    ${sum}      add    3    5
    should be equal as numbers      ${sum}      8

Get the status code
    ${code}    get resp    https://httpbin.org/status/200
    log to console    ${code}


