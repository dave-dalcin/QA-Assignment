*** Settings ***
Library    SeleniumLibrary
Variables    ../resources/Variables.py
#Please refer to Variables.py file for Test Data

Documentation   Scenario verifies whether the sign up functionalities are working properly
Resource    ../resources/Common.robot
Resource    ../page-objects/LandingPage.robot
Resource    ../page-objects/TopNav.robot
Resource    ../page-objects/SignUp.robot

Test Setup    Begin Web Test
Test Teardown   End Web Test

# robot -d results tests/TS-01-SignUpTests.robot
# run by tag: robot -d results -i tc1 tests/TS-01-SignUpTests.robot
*** Variables ***
#testdata

*** Test Cases ***
TC-01-User must be able to create a new account
    [Documentation]    This test was designed in order to verify whether the user is able to create a new account
    [Tags]    positive  tc1
    Go to BBlog Landing Page
    Click On Top Nav Sign Up
    #test case is failing on step above due to Def-1:Sign Up page is showing Sign In text instead of Sign Up
    Input Sign Up User Name     ${signUpNewUser}
    Input Sign Up Email    ${signUpNewEmail}
    Input Sign Up Password    ${signUpnewPasswd}
    Click On Sign Up Button
    Verify If UserName is Visible on Top Nav    ${signUpNewUser}

TC-02-User must not be able to sign up without all the attributes
    [Documentation]    This test verify if the system allows the user to create a new account withou all the attributes
    [Tags]    negative  tc2
    Go to BBlog Landing Page
    Click On Top Nav Sign Up
    #test case is failing on step above due to Def-1:Sign Up page is showing Sign In text instead of Sign Up
    Input Sign Up User Name     ${EMPTY}
    Input Sign Up Email     ${EMPTY}
    Input Sign Up Password  ${EMPTY}
    Click On Sign Up Button
    Verify If Untreated Error Messages Are Not Displayed
    #test case fails on step above due to def-3: Untreated error message
    Verify If UserName Error Message is Displayed
    Verify If Password Error Message is Displayed
    Verify If Email Error Message is Displayed

TC-03-User must not be able to sign up without password
    [Documentation]    This test verify if the system allows the user to create a new account withou all the attributes
    [Tags]    security  tc3
    Go to BBlog Landing Page
    Click On Top Nav Sign Up
    #test case is failing on step above due to Def-1:Sign Up page is showing Sign In text instead of Sign Up
    Input Sign Up User Name     ${signUpInvalidUser}
    Input Sign Up Email     ${signUpInvalidEmail}
    Input Sign Up Password  ${signUpInvalidPasswd}
    Click On Sign Up Button
    Verify If Untreated Error Messages Are Not Displayed
    Verify If Password Error Message is Displayed
    #test case fails on step above step due to Def-4. User was created without password

TC-04-User must not be able to sign up without username or without email
    [Documentation]    This test verify if the system allows the user to create a new account withou user name or email
    [Tags]    negative  tc4
    Go to BBlog Landing Page
    Click On Top Nav Sign Up
    #test case is failing on step above due to Def-1:Sign Up page is showing Sign In text instead of Sign Up
    #Credentials without User Name
    Input Sign Up User Name     ${EMPTY}
    Input Sign Up Email     ${signUpInvalidEmail}
    Input Sign Up Password  ${signUpInvalidPasswd}
    Click On Sign Up Button
    Verify If Untreated Error Messages Are Not Displayed
    Verify If UserName Error Message is Displayed
    #Credentials without Email
    Input Sign Up User Name     ${signUpInvalidUser}
    Input Sign Up Email     ${EMPTY}
    Input Sign Up Password  ${signUpInvalidPasswd}
    Click On Sign Up Button
    Verify If Untreated Error Messages Are Not Displayed
    Verify If Email Error Message is Displayed

TC-05-User must not be able to sign up with already taken credentials
    [Documentation]    This test was designed to make sure the user is not able to sign up with already taken credentials
    [Tags]    negative  tc5
    Go to BBlog Landing Page
    Click On Top Nav Sign Up
    #test case is failing on step above due to Def-1:Sign Up page is showing Sign In text instead of Sign Up
    Input Sign Up User Name     ${existentUser}
    Input Sign Up Email    ${existentEmail}
    Input Sign Up Password    ${existentPassword}
    Click On Sign Up Button
    Verify If Untreated Error Messages Are Not Displayed
    Verify If Already Taken Username Message is Displayed
    Verify If Already Taken Email Message is Displayed


