## Test Cases
Folder: ../test cases
I have created 30 Manual Tests in order to test Sign In, Sign Up, Profile and Article functionalities
Please check the Test Cases in ..test cases/QA Assignment Test Cases.xlsx file 
The defects are also described into above file 

## Defects evidences
Folder: ../defects 
12 defects were raised during the tests.
The defect evidences are placed in ../defects folder 
Videos are also available to provide better evidences 

#videos
Automation Tests information.zip - Please extract the video to see a video regarding the Test Automation execution
Manual Test Cases information.mp4 - Test Cases more information 

## test-automation
Folder: //test-automation
Automation Tool: Robot Framework (Selenium + python)
3 Test Suites are available. The test uses "Page objects" design and there are 6 page objects 
Test Suites:
TS-01-SignUpTests.robot - This test suite handles the Sign Up functionalities. Most of the tests are expected to fail due to Defects: Def-1 and Def-2
TS-02-SignInTests - This test suite handles the Sign Ip functionalities. Most of the tests are expected to fail due to Defect: Def-5. 
As the defect Def-5 makes the system request Email instead of UserName, the login is not possible in most of the scenarios. As workaround to make the test run, it is possible to replace username with user email
TS-03-FeedTests.robot - This test suite handles the Article Post functionalities. Most of the tests are expected to fail due to Defects: Def-1 and Def-2
Page Objects:
All the page objects contains the page locators (most with xpath and some with css) and the Robot Framework Keywords

TS-03-FeedTests.robot was developed using gherkin style 
The variables.py file is used to generate test data and use random data to make the tests dynamic

#Instructions to run the tests 
Go to https://www.python.org/downloads/ and download python 3.5 or higher
Install the following libraries via pip install:
pip intall robotframework
pip install robotframework-seleniumlibrary
pip install selenium

Install any Robot Framework IDE. I am using pycharm for Windows : 
https://download.jetbrains.com/python/pycharm-community-2020.3.3.exe?_ga=2.131287823.1485857963.1612760489-1411245259.1607774527
If you need any other pycharm version, please visit: https://www.jetbrains.com/pt-br/pycharm/download
Make sure to download the Community version

After all installed, go to //test-automation directory and run the following commands:
robot -d results tests
If you want to run by Test Suite, use the following commands:


robot -d results tests/TS-01-SignUpTests.robot
robot -d results tests/TS-02-SignInTests.robot
robot -d results tests/TS-03-FeedTests.robot

If you want to run by specific tag, please add the parament -i to the robot command.
e.g: robot -d results -i security tests/TS-01-SignUpTests.robot

  
