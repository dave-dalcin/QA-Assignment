*** Settings ***
Library    SeleniumLibrary
Variables    ../resources/Variables.py
Documentation   Scenario verifies whether the Feed functionalities are working properly
Resource    ../resources/Common.robot
Resource    ../page-objects/TopNav.robot
Resource    ../page-objects/ArticleEditor.robot
Resource    ../page-objects/Profile.robot

Test Setup    Begin Web Test
Test Teardown   End Web Test

*** Variables ***
#local test data
${myNewTitle}=   ${newArticleTitle}
${myNewAbout}=   ${newArticleAbout}
${myNewMarkdown}=   ${newArticleMarkdown}
${myNewTags}=   ${newArticleTags}
${myEditTitle}=   ${editArticleTitle}
${myEditAbout}=   ${editArticleAbout}
${myEditMarkdown}=   ${editArticleMarkdown}
${myEditTags}=   ${editArticleTags}


# robot -d results tests/TS-01-SignUpTests.robot
# run by tag: robot -d results -i tc23 tests/TS-03-FeedTests.robot

*** Test Cases ***
#Gherkin Style
TC-14-User must be able to post a new article
    [Documentation]    This test was designed to verify whether the user can post a new article and validate fields
    [Tags]    gherkin   positive    tc14
    Given User Login With User "${existentEmail}" And Password "${existentPassword}"
    When Click On Top Nav New Post
    And Input Article Title    ${newArticleTitle}
    And Input Article About    ${newArticleAbout}
    And Input Article Markdown    ${newArticleMarkdown}
    And Input Article Tags    ${newArticleTags}
    And Click On Publish Article Button
    Then Title Must Be "${newArticleTitle}"
    And Markdown Must Be "${newArticleMarkdown}"
    When Click On Top Nav Home
    And Click On Popular Tag "${newArticleTags}"
    Then About Must Be "${newArticleAbout}"

TC-17-User must be able to edit an article
    [Documentation]    This test was designed to verify whether the user is edit an artcile
    [Tags]    gherkin   positive    tc17
    Given User Login With User "${existentEmail}" And Password "${existentPassword}"
    When Click On Top Nav New Post
    And Input Article Title    ${myNewTitle}
    And Input Article About    ${myNewAbout}
    And Input Article Markdown    ${myNewMarkdown}
    And Input Article Tags    ${myNewTags}
    And Click On Publish Article Button
    And Click Edit Article Button
    And Input Article Title    ${myEditTitle}
    And Input Article About    ${myEditAbout}
    And Input Article Markdown    ${myEditMarkdown}
    And Input Article Tags    ${myEditTags}
    And Click On Publish Article Button
    Then Title Must Be "${myEditTitle}"
    And Markdown Must Be "${myEditMarkdown}"
    When Click On Top Nav Home
    And Click On Popular Tag "${myEditTags}"
    Then About Must Be "${myEditAbout}"

TC-18-User must be not able to post with blank fields
    [Documentation]    This test was designed to to make sure the user cannot post with blank fields
    [Tags]    tc18   negative
    Given User Login With User "${existentEmail}" And Password "${existentPassword}"
    When Click On Top Nav New Post
    And Input Article Title    ${EMPTY}
    And Input Article About    ${EMPTY}
    And Input Article Markdown    ${EMPTY}
    And Input Article Tags    ${EMPTY}
    And Click On Publish Article Button
    #The below test steps will fail Due to Def-10: Bblog alows the operator to create na Article with blank fields
    Then Article General Error Message Must Be Shown
    And Blank Article Title Error Message Must Be Shown
    And Blank Article About Error Message Must Be Shown
    And Blank Article Markdown Error Message Must Be Shown
    And Blank Article Tags Error Message Must Be Shown

TC-23-User must be able to delete an article
    [Documentation]    This test was designed to verify whether the can delete an article and perform logout
    [Tags]    gherkin   positive    tc23
    Given User Login With User "${existentEmail}" And Password "${existentPassword}"
    When Click On Top Nav New Post
    And Input Article Title    ${myNewTitle}
    And Input Article About    ${myNewAbout}
    And Input Article Markdown    ${myNewMarkdown}
    And Input Article Tags    ${myNewTags}
    And Click On Publish Article Button
    Then Title Must Be "${myNewTitle}"
    And Markdown Must Be "${myNewMarkdown}"
    When Click Delete ArticleButton
    And Click On Top Nav "${existentUser}" User
    Then Post "${myNewTitle}" Must Not Exist
    When Click On Top Nav Settings Button
    And Click On Logout Button
    Then Sign In Must Be Visible On TopNav
















