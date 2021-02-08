*** Settings ***
Library  SeleniumLibrary
Documentation    07-02-2021: Dave Dalcin - This page object handles the Profile functionalities

*** Variables ***
#locators
${LOC_LOGOUT_BUTTON} =   //button[normalize-space()='Or click here to logout.']

*** Keywords ***
Click On Logout Button
    wait until element is visible   ${LOC_LOGOUT_BUTTON}     error=Logout button is not vibible on Top Nav
    click element   ${LOC_LOGOUT_BUTTON}