*** Settings ***
Library    SSHLibrary
Library     OperatingSystem
Variables    ../Library/variables.py
*** Variables ***


*** Test Cases ***
Simple Test
    [Documentation]     Use to check with Linux
    [Tags]      Regression
    Open Connection  ${host}
    Enable SSH Logging  ${host}
    Login With Public Key  gaurav  C:\\Users\\gaurav\\.ssh\\id_rsa
    #login  ${username}   ${password}
    #${dir1}=    Execute Command    mkdir /home/gaurav/theja
    log     done
    Close Connection