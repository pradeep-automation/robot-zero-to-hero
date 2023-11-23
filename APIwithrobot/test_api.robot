*** Settings ***
Library    RequestsLibrary

*** Keywords ***

*** Variables ***
${URL}      http://mule.petco.devstack.vetsource.dev:8084/fulfillment/partner/v1/vets/export/

*** Test Cases ***
test the get API
    &{headers}      create dictionary       Authorization=Basic cGV0Y286YXdvIWlmTDIzNV4x
    ${resp}         get    ${URL}           headers=&{headers}
    log to console      ${resp.json()}[0][id]
    should be equal as strings      ${resp.json()}[0][practice_name]    VCA TEST     not equal bro