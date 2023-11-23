*** Settings ***
Resource    ../Pages/loginpage.robot
Library     DataDriver


*** Test Cases ***
Login to OrangeHrm
    Open Browser to Login Page

    Login with credentials    Admin       admin123




