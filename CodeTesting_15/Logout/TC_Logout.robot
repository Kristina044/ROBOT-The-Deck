*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}       http://127.0.0.1:8000/admin/login  # Replace with the actual login URL
${USERNAME}  admin
${PASSWORD}  admin12345

*** Test Cases ***
LoginTest
    Open Browser  ${URL}  chrome
    Set Selenium Implicit Wait  5
    Input Text    name=username    ${USERNAME}
    Input Password    name=password    ${PASSWORD}
    Click Button    xpath=//input[@value='Sign In']
    # Ensure the menu is expanded
    Click Button    xpath=//*[@id="page-top"]/div[3]/div/div[3]/button[1]
Logout
    Click Element  xpath=//*[@id="userDropdown"]/span
    Sleep  1
    Click Link  xpath=//*[@id="content"]/nav/ul/li/div/a[2]
    Sleep  2


*** Keywords ***
