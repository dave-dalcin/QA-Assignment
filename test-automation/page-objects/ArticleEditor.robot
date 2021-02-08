*** Settings ***
Library    String
Library  SeleniumLibrary

Documentation    06-02-2021: Dave Dalcin - This page object handles the TopNav functionalities
Resource    SignUp.robot
Resource    SignIn.robot
Resource    LandingPage.robot
Library    SeleniumLibrary

*** Variables ***
#locators
${LOC_PUBLISH_BUTTON} =     //button[normalize-space()='Publish Article']
${LOC_POST_COMMENT_BUTTON} =    //button[normalize-space()='Post Comment']
${LOC_EDIT_ARTICLE_BUTTON} =    //div[@class='container']//a[@class='btn btn-sm btn-outline-secondary'][normalize-space()='Edit Article']
${LOC_DELETE_ARTICLE_BUTTON} =    //div[@class='container']//button[@class='btn btn-sm btn-outline-danger'][normalize-space()='Delete Article']
${LOC_INPUT_ARTICLE_TITLE} =    //input[@placeholder='Article Title']
${LOC_INPUT_ARTICLE_ABOUT} =    //input[@placeholder="What's this article about?"]
${LOC_INPUT_ARTICLE_MARKDOWN} =    //textarea[@placeholder='Write your article (in markdown)']
${LOC_INPUT_ARTICLE_TAGS} =    //input[@placeholder='Enter Tags']
${LOC_VIEW_POST_TITLE} =    //h1[normalize-space()=
${LOC_VIEW_POST_MARKDOWN} =    //p[normalize-space()=
${LOC_VIEW_POST_ABOUT} =    //p[normalize-space()=

${LOC_ARTICLE_ERROR_MESSAGES} =     //app-list-errors/*[@class="error-messages"]
${LOC_TITLE_BLANK_ERROR_MESSAGES} =     //li[normalize-space()="Title can't be blank"]
${LOC_ABOUT_BLANK_ERROR_MESSAGES} =     //li[normalize-space()="What's this article about? can't be blank"]
${LOC_MARKDOWN_BLANK_ERROR_MESSAGES} =     //li[normalize-space()="Write your article (in markdown) can't be blank"]
${LOC_TAGS_BLANK_ERROR_MESSAGES} =     //li[normalize-space()="Enter Tags can't be blank"]



*** Keywords ***
Verify If Article Editor Is Loaded
    wait until page contains element    ${LOC_PUBLISH_BUTTON}       error= Article Editor Page is not Loaded

Input Article Title
    [Arguments]    ${myTitle}
    input text    ${LOC_INPUT_ARTICLE_TITLE}    ${myTitle}

Input Article About
    [Arguments]    ${myAbout}
    input text    ${LOC_INPUT_ARTICLE_ABOUT}    ${myAbout}

Input Article Markdown
    [Arguments]    ${myMarkdown}
    input text    ${LOC_INPUT_ARTICLE_MARKDOWN}    ${myMarkdown}

Input Article Tags
    [Arguments]    ${myTags}
    input text    ${LOC_INPUT_ARTICLE_TAGS}    ${myTags}

Click On Publish Article Button
    set focus to element    ${LOC_PUBLISH_BUTTON}
    click button    ${LOC_PUBLISH_BUTTON}
    wait until element is visible    ${LOC_POST_COMMENT_BUTTON}

Verify if Article Title is Correct
    wait until element is visible    ${LOC_POST_COMMENT_BUTTON}     error="Post Comment" button is not displayed

Title Must Be "${title}"
    wait until element is visible    ${LOC_VIEW_POST_TITLE}'${title}']

Markdown Must Be "${markdown}"
    wait until element is visible    ${LOC_VIEW_POST_MARKDOWN}'${markdown}']

About Must Be "${about}"
    wait until element is visible    ${LOC_VIEW_POST_ABOUT}'${about}']

Article General Error Message Must Be Shown
    wait until page contains element    ${LOC_ARTICLE_ERROR_MESSAGES}   error=Validation error messages are not displayed


Blank Article Title Error Message Must Be Shown
    Article General Error Message Must Be Shown
    wait until page contains element    ${LOC_TITLE_BLANK_ERROR_MESSAGES}   error=Title error messages are not displayed

Blank Article About Error Message Must Be Shown
    Article General Error Message Must Be Shown
    wait until page contains element    ${LOC_ABOUT_BLANK_ERROR_MESSAGES}   error=About error messages are not displayed

Blank Article Markdown Error Message Must Be Shown
    Article General Error Message Must Be Shown
    wait until page contains element    ${LOC_MARKDOWN_BLANK_ERROR_MESSAGES}   error=Markdown error messages are not displayed

Blank Article Tags Error Message Must Be Shown
    Article General Error Message Must Be Shown
    wait until page contains element    ${LOC_TAGS_BLANK_ERROR_MESSAGES}   error=Tags error messages are not displayed

Click Post "${title}"
    wait until page contains element    ${LOC_VIEW_POST_TITLE}'${title}']   error=Post Button was not loaded
    click element   ${LOC_VIEW_POST_TITLE}'${title}']

Click Edit Article Button
    wait until page contains element    ${LOC_EDIT_ARTICLE_BUTTON}  error=Edit Button was not loaded
    click element   ${LOC_EDIT_ARTICLE_BUTTON}
    wait until element is visible   ${LOC_PUBLISH_BUTTON}

Click Delete Article Button
    wait until page contains element    ${LOC_DELETE_ARTICLE_BUTTON}  error=Delete Button was not loaded
    click element   ${LOC_DELETE_ARTICLE_BUTTON}
    wait until element is visible   ${LOC_BBLOG_LOGO}

Post "${title}" Must Not Exist
    page should not contain element    ${LOC_VIEW_POST_TITLE}'${title}']   error=Article was not deleted

