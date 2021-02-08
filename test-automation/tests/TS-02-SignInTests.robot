*** Settings ***
Library    SeleniumLibrary
Variables    ../resources/Variables.py
#Please refer to Variables.py file for Test Data

Documentation   Scenario verifies whether the sign up functionalities are working properly
Resource    ../resources/Common.robot
Resource    ../page-objects/LandingPage.robot
Resource    ../page-objects/TopNav.robot
Resource    ../page-objects/SignIn.robot


# robot -d results tests/TS-01-SignUpTests.robot
# run by tag: robot -d results -i tc7 tests/TS-02-SignInTests.robot

Test Setup    Begin Web Test
Test Teardown   End Web Test

*** Variables ***

*** Test Cases ***
TC-06-User must be able to sign in with valid credentials
    [Documentation]    This test was designed to verify whether the user is able to sign in with valid credentials
    [Tags]    positive  security  tc6
    Go to BBlog Landing Page
    Click On Top Nav Sign In
    Input Sign In User Name     ${existentUser}
    #Input Sign In User Name     ${existenEmail}
    Input Sign In Password  ${existentPassword}
    Click On Sign In Button
    #The above step fails due to defect Def-5: Page is requesting Username but is accepting Email instead of Username
    Verify If UserName is Visible on Top Nav    ${existentUser}}

TC-07-User must not be able to sign in with blank UserName or blank Password
    [Documentation]    This test was designed to make sure the user is not able to sign in with blank username or blank password
    [Tags]    negative  tc7
    Go to BBlog Landing Page
    Click On Top Nav Sign In
    Input Sign In User Name     ${EMPTY}
    Input Sign In Password  ${existentPassword}
    Click On Sign In Button
    Verify If Sign In Username Error Message is Displayed
    #The above step fails due to defect Def-5: Page is requesting Username but is accepting Email instead of Username
    Input Sign In User Name     ${existentUser}}
    Input Sign In Password  ${EMPTY}
    Click On Sign In Button
    Verify If Sign In Password Error Message is Displayed