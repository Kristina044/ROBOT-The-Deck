*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://127.0.0.1:8000/admin/login  # Replace with the actual login URL
${USERNAME}  admin
${PASSWORD}  admin12345

*** Test Cases ***
LoginTest
    Open Browser  ${URL}  chrome
    Set Selenium Implicit Wait  5
    Input Text  name=username  ${USERNAME}
    Input Password  name=password  ${PASSWORD}
    Click Button  xpath=//input[@value='Sign In']
    Sleep  2
    [Teardown]  Close Browser

*** Keywords ***

