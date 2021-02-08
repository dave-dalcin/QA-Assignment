*** Settings ***
Library  SeleniumLibrary
Documentation    06-02-2021: Dave Dalcin - This page object handles the SignUp functionalities
Resource    ../page-objects/TopNav.robot
Resource    ../page-objects/LandingPage.robot

*** Variables ***
#locators
${LOC_INPUT_USER_NAME} =    //input[@placeholder="Username"]
${LOC_INPUT_EMAIL} =    //input[@placeholder="Email"]
${LOC_INPUT_PASSWORD} =     //input[@placeholder="Password"]
${LOC_SIGN_UP_TEXT} =   //h1[@class="text-xs-center"]
${LOC_SIGN_UP_BUTTON} =     //button[@type="submit"]
${LOC_ERROR_MESSAGES} =     //app-list-errors/*[@class="error-messages"]
${LOC_PASSWORD_INVALID_ERROR_MESSAGES} =    //li[contains(text(),'message The "password" argument must be one of type string')]
${LOC_PASSWORD_BLANK_ERROR_MESSAGES} =    //li[contains(text(),'password can't be blank')]
${LOC_EMAIL_BLANK_ERROR_MESSAGES} =   //li[normalize-space()="email can't be blank"]
${LOC_EMAIL_INVALID_ERROR_MESSAGES} =    //li[normalize-space()='email is invalid']
${LOC_USERNAME_BLANK_ERROR_MESSAGES} =     //li[normalize-space()="username can't be blank"]
${LOC_USERNAME_INVALID_ERROR_MESSAGES} =      //li[normalize-space()='username is invalid']
${LOC_ALREADY_TAKEN_USERNAME_MESSAGE} =      //li[normalize-space()='username is already taken.']
${LOC_ALREADY_TAKEN_EMAIL_MESSAGE} =      //li[normalize-space()='email is already taken.']

${LOC_UNTREATED_ERROR_MESSAGES} =    //li[normalize-space()='error [object Object]']




*** Keywords ***
Verify If Sign Up Page Is Loaded
    wait until element contains     ${LOC_SIGN_UP_TEXT}     Sign in     error=Sign Up page is not showing "Sign up" text

Input Sign Up User Name
    [Arguments]    ${myUserName}
    input text    ${LOC_INPUT_USER_NAME}    ${myUserName}   clear=True

Input Sign Up Email
    [Arguments]    ${myEmail}
    input text    ${LOC_INPUT_EMAIL}    ${myEmail}  clear=True

Input Sign Up Password
    [Arguments]    ${myPassword}
    input password    ${LOC_INPUT_PASSWORD}    ${myPassword}    clear=True

Click On Sign Up Button
    set focus to element    ${LOC_SIGN_UP_BUTTON}
    sleep    2s
    click button    ${LOC_SIGN_UP_BUTTON}

Verify If Error Message Is Displayed
    wait until page contains element    ${LOC_ERROR_MESSAGES}   error=Validation error messages are not displayed

Verify If Password Error Message is Displayed
    Verify If Error Message Is Displayed
    ${ret1} =    run keyword and return status    page should contain element   ${LOC_PASSWORD_INVALID_ERROR_MESSAGES}
    ${ret2} =    run keyword and return status    page should contain element   ${LOC_PASSWORD_BLANK_ERROR_MESSAGES}
    should be true    ${ret1} or ${ret2}    msg=Password validation error message is not displayed

Verify If UserName Error Message is Displayed
    Verify If Error Message Is Displayed
    ${ret1} =    run keyword and return status    page should contain element   ${LOC_USERNAME_INVALID_ERROR_MESSAGES}
    ${ret2} =    run keyword and return status    page should contain element   ${LOC_USERNAME_BLANK_ERROR_MESSAGES}
    should be true    ${ret1} or ${ret2}    msg=User Name validation error message is not displayed

Verify If Email Error Message is Displayed
    Verify If Error Message Is Displayed
    ${ret1} =    run keyword and return status    page should contain element   ${LOC_USERNAME_INVALID_ERROR_MESSAGES}
    ${ret2} =    run keyword and return status    page should contain element   ${LOC_USERNAME_BLANK_ERROR_MESSAGES}
    should be true    ${ret1} or ${ret2}    msg=Email validation error message is not displayed

Verify If Already Taken Username Message is Displayed
    Verify If Error Message Is Displayed
    page should contain element    ${LOC_ALREADY_TAKEN_USERNAME_MESSAGE}    message=Username already taken error message is not displayed

Verify If Already Taken Email Message is Displayed
    Verify If Error Message Is Displayed
    page should contain element    ${LOC_ALREADY_TAKEN_EMAIL_MESSAGE}    message=Email already taken error message is not displayed


Verify If Untreated Error Messages Are Not Displayed
    Verify If Error Message Is Displayed
    page should not contain element     ${LOC_UNTREATED_ERROR_MESSAGES}     message=Untreated error message is displayed


User SignUp
    [Arguments]    ${myNewUserName}     ${myNewEmail}   ${myNewPassword}
    Go to BBlog Landing Page
    Click On Top Nav Sign Up
    Input Sign Up User Name     ${myNewUserName}
    Input Sign Up Email    ${myNewEmail}
    Input Sign Up Password    ${myNewPassword}
    Click On Sign Up Button


#gherkin style
User SingUp With User "${myNewUserName}" Email "${myNewEmail}" And Password "${myNewPassword}"
    User SignUp      ${myNewUserName}    ${myNewEmail}   ${myNewPassword}