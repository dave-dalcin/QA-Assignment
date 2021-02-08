*** Settings ***
Library  SeleniumLibrary
Documentation    06-02-2021: Dave Dalcin - This page object handles the Landing Page functionalities
Resource    ../resources/Variables.robot
Variables    ../resources/Variables.py


*** Variables ***
${BBLOG_URL} =  https://${BASIC_AUTH_USER}:${BASIC_AUTH_PASSWORD}@qa-task.backbasecloud.com/
#locators
${LOC_BBLOG_LOGO} =    //h1[@class="logo-font"]
${LOC_POPULAR_TAG} =    //a[normalize-space()='

*** Keywords ***
Go to BBlog Landing Page
    go to   ${BBLOG_URL}
    wait until element contains    ${LOC_BBLOG_LOGO}    BBlog   error=Landing Page BBlog logo is not visible

Click On Popular Tag "${tag}"
    wait until element is visible    ${LOC_POPULAR_TAG}${tag}']
    click element    ${LOC_POPULAR_TAG}${tag}']
