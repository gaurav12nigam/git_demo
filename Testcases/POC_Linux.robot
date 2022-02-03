*** Settings ***
Library    SSHLibrary
Library    OperatingSystem
Variables    ../Library/variables.py
Suite Setup     Connection To Remote Machine
Suite Teardown    Close Connection

*** Test Cases ***

Copy Function For Directory
    [Documentation]  This function is used for implementing Copy Functionality for directory
    [Tags]      Cut_Copy
    ${output}=	Read Until Prompt
    Should End With	${output}	root@gaurav-VirtualBox:~#
    Write       cd ${src_path}
    ${output}=	Read Until Prompt
    Write       cp -r ${src_path} ${dst_path}
    ${output}=	Read Until Prompt
    Log     Copy Operation Completed successfully

Cut Function For Directory
    [Documentation]  This function is used for implementing Cut Functionality for directory
    [Tags]      Cut_Copy
    Write       mv ${cut_src_path} ${cut_dst_path}
    ${output}=	Read Until Prompt
    Log     Cut Operation Completed successfully

Cut Function For File
    [Documentation]  This function is used for implementing Cut Functionality for File
    [Tags]      Cut_Copy
    Write       mv ${cut_src_path_file} ${cut_dst_path_file}
    ${output}=	Read Until Prompt
    Log     Cut Operation Completed successfully

Sending And Receiving Files
    [Documentation]  This function is used for implementing copy file from one machine to another machine
    [Tags]      Cut_Copy
   put file    ${src_path_cross_copy}       ${dst_path}
   get file    ${dst_path}TextFile.txt      ${src_path_cross_copy}

Test_If
    [Documentation]  This function is used for implementing copy file from one machine to another machine
    [Tags]      If_else_condition_checking
    Run Keyword If  ${choice} == 1   List Directory in Folder
    ...  ELSE IF  ${choice} == 2     List Files in Folder
    ...  ELSE  Log     Nothing Matched

Write Data Into File
    [Documentation]  This function is used for implementing Write content in a File
    [Tags]      Reading_Writing
    Execute Command     echo 'hi this is poc work' >${path_for_write_in_file}
    File Should Exist   ${path_for_write_in_file}

Read data from file
    [Documentation]  This function is used for implementing Read content in a File
    [Tags]      Reading_Writing
    ${output}=  Execute Command     cat ${path_for_write_in_file}
    Log     ${output}

Regular Expression
    [Documentation]  This function is used for implementing usage of  regX
    [Tags]      Reading_Writing
    open connection    ${host}
    Login   ${username}    ${password}
    Write  sudo su -
    ${output}=    Read Until Regexp  \\[.*\\].*:
    Should Contain    ${output}  [sudo] password for gaurav:
    Write  ${password}
    ${output}=    Read Until Regexp  .*@
    Should Contain    ${output}  root@


*** Keywords ***
Connection To Remote Machine
    Open Connection  ${host}
    login  ${username}   ${password}
    Write	sudo su -
    Write	${PASSWORD}
    Set Client Configuration	prompt=#

List Directory in Folder
    [Documentation]  This function is used to list the directory in specified path
    [Tags]      List_Operations
    ${dirs}=            SSHLibrary.List Directories in Directory   ${src_path_for_listing_dir}
    FOR      ${dir}      IN   ${dirs}
        log     ${dir}
    END

List Files in Folder
    [Documentation]  This function is used to list the files in specified path
    [Tags]      List_Operations
    ${file_lists}=            SSHLibrary.List Directories in Directory   ${src_path}
    FOR      ${file}      IN   ${file_lists}
        log     ${file}
    END