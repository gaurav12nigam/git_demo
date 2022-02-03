*** Settings ***
Suite Teardown    Close Browser
Library           SeleniumLibrary
Variables         ../Library/locators.py

*** Variables ***
${error}          error
${errors}         errors
${em}             utv.raj@gmail.com
${em2}            veera9945454015@gmail.com
${Wrong_passwd}    lkarle8463!a
${firstname}      Raj
${lastname}       Veer
${passwd}         Karlehcl8463!a
${address}        a street #12345
${city}           Wichita
${state}          Kansas
${state1}         -
${zip}            60012
${phno}           1234567890

*** Test Cases ***
TC1
    #TC Wrong password login should fail
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Element    ${xpath_for_sign_in}
    Wait until page contains    Authentication    timeout=20s
    Input Text    //input[@id = 'email']    ${em}
    Input Password    //input[@id="passwd"]    ${Wrong_passwd}
    Click Element    //button[@id="SubmitLogin"]
    Page Should Contain    There is 1 error

TC2
    Reload Page
    Wait until page contains    Authentication    timeout=20s
    Sleep    3
    Input Text    ${xpath_for_email}    ${em}
    Click Element    ${id_for_create_account_btn}
    Sleep    3
    Page Should Contain    An account using this email address has already been registered. Please enter a valid password or request a new one.

TC3
    #TC all the mandatory fields missing
    Reload Page
    Sleep    5
    Input Text    ${xpath_for_email}    ${em2}
    Click Element    ${id_for_create_account_btn}
    Wait until page contains    Create an account    timeout=20s
    Sleep    5
    Click Element    ${id_for_mr}
    Click Element    ${id_for_reg_btn}
    Wait until page contains    error
    Check_errors

TC4_name_missing
    Reload Page
    Wait until page contains    Create an account    timeout=20s
    Sleep    5
    Click Element    ${id_for_mr}
    #Input Text    ${id_for_first_name}    ${firstname}
    #Input Text    ${id_for_last_name}    ${lastname}
    Input Text    ${id_for_pwd}    ${passwd}
    Input Text    ${id_for_address}    ${address}
    Input Text    ${id_for_city}    ${city}
    Scroll Element Into View    ${id_for_state}
    Select From List By Label    ${id_for_state}    ${state}
    Input Text    ${id_for_zip}    ${zip}
    Input Text    ${id_for_mobile}    ${phno}
    Click Element    ${id_for_reg_btn}
    Wait until page contains    error
    Check_errors

TC5_passwd_missing
    Reload Page
    Wait until page contains    Create an account    timeout=20s
    Sleep    5
    Click Element    ${id_for_mr}
    Input Text    ${id_for_first_name}    ${firstname}
    Input Text    ${id_for_last_name}    ${lastname}
    Clear Element Text    ${id_for_pwd}
    #Input Text    ${id_for_pwd}    ${passwd}
    Input Text    ${id_for_address}    ${address}
    Input Text    ${id_for_city}    ${city}
    Scroll Element Into View    ${id_for_state}
    Select From List By Label    ${id_for_state}    ${state}
    Input Text    ${id_for_zip}    ${zip}
    Input Text    ${id_for_mobile}    ${phno}
    Click Element    ${id_for_reg_btn}
    Wait until page contains    error
    Check_errors

TC6_address_city_missing
    Reload Page
    Wait until page contains    Create an account    timeout=20s
    Sleep    5
    Click Element    ${id_for_mr}
    Input Text    ${id_for_first_name}    ${firstname}
    Input Text    ${id_for_last_name}    ${lastname}
    Input Text    ${id_for_pwd}    ${passwd}
    Clear Element Text    ${id_for_address}
    Clear Element Text    ${id_for_city}
    #Input Text    ${id_for_address}    ${address}
    #Input Text    ${id_for_city}    ${city}
    Scroll Element Into View    ${id_for_state}
    Select From List By Label    ${id_for_state}    ${state}
    Input Text    ${id_for_zip}    ${zip}
    Input Text    ${id_for_mobile}    ${phno}
    Click Element    ${id_for_reg_btn}
    Wait until page contains    error
    Check_errors

TC7_zipcodemissing
    Reload Page
    Wait until page contains    Create an account    timeout=20s
    Sleep    5
    Click Element    ${id_for_mr}
    Input Text    ${id_for_first_name}    ${firstname}
    Input Text    ${id_for_last_name}    ${lastname}
    Input Text    ${id_for_pwd}    ${passwd}
    Input Text    ${id_for_address}    ${address}
    Input Text    ${id_for_city}    ${city}
    Scroll Element Into View    ${id_for_state}
    Select From List By Label    ${id_for_state}    ${state}
    Clear Element Text    ${id_for_zip}
    #Input Text    ${id_for_zip}    ${zip}
    Input Text    ${id_for_mobile}    ${phno}
    Click Element    ${id_for_reg_btn}
    Wait until page contains    error
    Check_errors

TC8_incoorectzipcode
    Reload Page
    Wait until page contains    Create an account    timeout=20s
    Sleep    5
    Click Element    ${id_for_mr}
    Input Text    ${id_for_first_name}    ${firstname}
    Input Text    ${id_for_last_name}    ${lastname}
    Input Text    ${id_for_pwd}    ${passwd}
    Input Text    ${id_for_address}    ${address}
    Input Text    ${id_for_city}    ${city}
    Scroll Element Into View    ${id_for_state}
    Select From List By Label    ${id_for_state}    ${state}
    Input Text    ${id_for_zip}    600
    Input Text    ${id_for_mobile}    ${phno}
    Click Element    ${id_for_reg_btn}
    Wait until page contains    error
    Check_errors

TC9_statemissing
    Reload Page
    Wait until page contains    Create an account    timeout=20s
    Sleep    5
    Click Element    ${id_for_mr}
    Input Text    ${id_for_first_name}    ${firstname}
    Input Text    ${id_for_last_name}    ${lastname}
    Input Text    ${id_for_pwd}    ${passwd}
    Input Text    ${id_for_address}    ${address}
    Input Text    ${id_for_city}    ${city}
    Select From List By Label    ${id_for_state}    ${state1}
    #Scroll Element Into View    ${id_for_state}
    #Select From List By Label    ${id_for_state}    ${state}
    Input Text    ${id_for_zip}    ${zip}
    Input Text    ${id_for_mobile}    ${phno}
    Click Element    ${id_for_reg_btn}
    Wait until page contains    error
    Check_errors
    Close Browser

*** Keywords ***
Check_errors
    ${e1}=    Run Keyword and Return Status    Page Should Contain    ${error}
    ${e2}=    Run Keyword and Return Status    Page Should Contain    ${errors}
    IF    (${e1} or ${e2})
    ${err_txt}=    Get Text    //div[@id='center_column']/div
    Log    ${err_txt}
    END
