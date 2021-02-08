*** Settings ***
Library  SeleniumLibrary
Documentation    06-02-2021: Dave Dalcin - This page object handles the SignIn functionalities

*** Variables ***
#locators
${LOC_SIGN_UP_TEXT} =   //h1[normalize-space()='Sign in']
${LOC_INPUT_SIGNIN_USER_NAME} =    //input[@placeholder="Username"]
${LOC_INPUT_SIGNIN_PASSWORD} =     //input[@placeholder="Password"]
${LOC_SIGN_IN_BUTTON} =     //button[normalize-space()='Sign in']
${LOC_SIGN_IN_ERROR_MESSAGES} =     //app-list-errors/*[@class="error-messages"]
${LOC_SIGN_IN_USERNAME_BLANK_ERROR_MESSAGES} =     //li[normalize-space()="username can't be blank"]
${LOC_SIGN_IN_PASSWORD_BLANK_ERROR_MESSAGES} =    //li[normalize-space()="password can't be blank"]


*** Keywords ***
Verify If Sign In Page Is Loaded
    wait until page contains element    ${LOC_SIGN_UP_TEXT}     error= Sign In page is not showing "Sign in" text

Input Sign In User Name
    [Arguments]    ${myUserName}
    input text    ${LOC_INPUT_SIGNIN_USER_NAME}    ${myUserName}    clear=True

Input Sign In Password
    [Arguments]    ${myPassword}
    clear element text    ${LOC_INPUT_SIGNIN_PASSWORD}
    input text    ${LOC_INPUT_SIGNIN_PASSWORD}    ${myPassword}
    log    ${myPassword}

Click On Sign In Button
    set focus to element    ${LOC_SIGN_IN_BUTTON}
    sleep    2s
    click button    ${LOC_SIGN_IN_BUTTON}

Verify If Sign In Error Message Is Displayed
    wait until page contains element    ${LOC_SIGN_IN_ERROR_MESSAGES}   error=Validation error messages are not displayed

Verify If Sign In Password Error Message is Displayed
    Verify If Sign In Error Message Is Displayed
    wait until page contains element    ${LOC_SIGN_IN_PASSWORD_BLANK_ERROR_MESSAGES}    error=Password Validation error messages are not displayed

Verify If Sign In Username Error Message is Displayed
    Verify If Sign In Error Message Is Displayed
    wait until page contains element    ${LOC_SIGN_IN_USERNAME_BLANK_ERROR_MESSAGES}    error=Username Validation error messages are not displayed
