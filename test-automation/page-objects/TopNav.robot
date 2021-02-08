*** Settings ***
Library    String
Library  SeleniumLibrary

Documentation    06-02-2021: Dave Dalcin - This page object handles the TopNav functionalities
Resource    SignUp.robot
Resource    SignIn.robot
Resource    ArticleEditor.robot
Library    SeleniumLibrary

*** Variables ***
#locators
${LOC_SIGN_UP} =    //a[@routerlink="/register"]
${LOC_SIGN_IN} =    //a[@routerlink="/login"]
${LOC_NEW_POST} =   //a[@routerlink='/editor']
${LOC_TOP_NAV_SETTINGS} =   //a[@routerlink='/settings']
${LOC_TOPNAV_HOME} =    //a[normalize-space()='Home']
${LOC_TOPNAV_SIGNIN} =    //a[normalize-space()='Sign in']
${LOC_TOPNAV_USERNAME} =    //a[@class="nav-link"][@href="#/profile
${LOC_HOME_BBLOG_LOGO} =    //h1[@class="logo-font"]



#//a[@class="nav-link"][@href="#/profile/newuser20"]
#//a[normalize-space()='newuser20']

*** Keywords ***
Verify If UserName is Visible on Top Nav
    [Arguments]    @{myUserName}
    #element should be visible    ${LOC_TOPNAV_USERNAME}/@{myUserName}/"]
    #wait until element is visible    //a[normalize-space()='newuser20']
    ${myUser} =     set variable    @{myUserName}
    ${myUser} =     convert to lower case    ${myUser}
    ${myLocator} =  set variable    ${LOC_TOPNAV_USERNAME}/${myUser}"]
    wait until element is visible    ${myLocator}   error= ${myUser} User Name is not visible on Top Nav

Click On Top Nav Sign Up
    click element    ${LOC_SIGN_UP}
    Verify If Sign Up Page Is Loaded

Click On Top Nav Sign In
    click element    ${LOC_SIGN_IN}
    Verify If Sign In Page Is Loaded

Click On Top Nav New Post
    wait until element is visible    ${LOC_NEW_POST}
    click element    ${LOC_NEW_POST}
    Verify If Article Editor Is Loaded

Click On Top Nav Home
    wait until element is visible    ${LOC_TOPNAV_HOME}
    click element    ${LOC_TOPNAV_HOME}
    wait until element contains    ${LOC_HOME_BBLOG_LOGO}    BBlog   error=BBlog logo is not visible

Click On Top Nav "${logged}" User
    ${myUser} =     set variable    ${logged}
    ${myUser} =     convert to lower case    ${myUser}
    ${myLocator} =  set variable    ${LOC_TOPNAV_USERNAME}/${myUser}"]
    wait until element is visible    ${myLocator}   error= ${myUser} User Name is not visible on Top Nav
    click element   ${myLocator}

Click On Top Nav Settings Button
    wait until element is visible   ${LOC_TOP_NAV_SETTINGS}     error=Settings button is not vibible on Top Nav
    click element   ${LOC_TOP_NAV_SETTINGS}

Sign In Must Be Visible On TopNav
    wait until element is visible   ${LOC_TOPNAV_SIGNIN}     error=SignIn is not vibible on Top Nav




