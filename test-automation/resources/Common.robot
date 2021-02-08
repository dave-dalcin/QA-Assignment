*** Settings ***
Library  SeleniumLibrary
Library  String
Documentation   Common keywords for all Tests
Resource    ../page-objects/LandingPage.robot
Resource    ../page-objects/TopNav.robot

*** Variables ***
${BROWSER} =    chrome

*** Keywords ***
Begin Web Test
    open browser    about:blank     ${BROWSER}
    maximize browser window

End Web Test
    close browser

User Login
    [Arguments]    ${myUserName}    ${myPassword}
    Go to BBlog Landing Page
    Click On Top Nav Sign In
    Input Sign In User Name     ${myUserName}
    Input Sign In Password  ${myPassword}
    Click On Sign In Button

Generate Randon Text
    ${tempVar} =    generate random string    3
    [Return]    generate random string

#Gherkin Style
User Login With User "${myUserName}" And Password "${myPassword}"
    User Login    ${myUserName}     ${myPassword}

