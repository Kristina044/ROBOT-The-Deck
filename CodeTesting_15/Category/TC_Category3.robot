*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}           http://127.0.0.1:8000/admin/login  # Replace with the actual login URL
${USERNAME}      admin
${PASSWORD}      admin12345
${NAME}          Minuman
${DESCRIPTION}   Ini adalah Minuman

*** Test Cases ***
LoginTest
    Open Browser  ${URL}  chrome
    Set Selenium Implicit Wait  5
    Input Text    name=username    ${USERNAME}
    Input Password    name=password    ${PASSWORD}
    Click Button    xpath=//input[@value='Sign In']
    # Ensure the menu is expanded
    Click Button    xpath=//*[@id="page-top"]/div[3]/div/div[3]/button[1]
    Click Element    xpath=//a[@data-target='#category']
    Sleep    1    # Give time for the menu to expand
    Click Element    xpath=//a[contains(@class, 'collapse-item') and contains(@href, '/admin/category/create')]
    Sleep    2
    Input Text    id=name    ${NAME}
    # Click the 'Create' button
    Click Button    xpath=//button[@onclick='validateForm(event)']
    Sleep    2
    # Click the 'Yes, create it!' button
    Click Button    xpath=//button[@class='swal2-confirm swal2-styled swal2-default-outline']
    Sleep    2
    [Teardown]    Close Browser

*** Keywords ***
