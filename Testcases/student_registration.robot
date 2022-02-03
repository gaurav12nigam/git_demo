*** Settings ***
Library  SeleniumLibrary
Variables  ../Library/locators.py

*** Variables ***
${fname}  Gaurav
${lname}  Nigam
${email}  gaurav.nigam@gmail.com
${contact}  9874563201
${adrs}  A-24,Karnal Haryana
${gender}  Male
${hb1}  Sports
${hb2}  Music
${file_path}  C:\\Users\\gaurav\\Desktop\\gaurav-nigam.jpg
${subject}  computer
${state}  Haryana
${city}  Karnal

*** Test Cases ***
MyTest
    [documentation]  Registration Automation
    [tags]  Regression
    ##################Browser Related#################################
    Open Browser    ${url1}  ${browser}
    maximize browser window
    sleep  5
    #############################################
    Input Text  ${xpath_for_fname}  ${fname}
    Input Text  ${xpath_for_lname}  ${lname}
    Input Text  ${xpath_for_email}  ${email}
    Input Text  ${xpath_for_contact}  ${contact}
    Input Text  ${xpath_for_adrs}  ${adrs}
    ##########Radio Button##################
    Click Element  ${xpath_for_gender}
    #################File-upload#############
    choose file   ${xpath_for_file_upload}  ${file_path}
    ##############subjects#########################
    Press Keys    ${xpath_for_subject}  ${subject}
    click element  ${xpath_for_choice}
    ##############check box##################
    Click Element  ${xpath_for_hobbies1}
    Click Element  ${xpath_for_hobbies2}
    ##############List box##################
    scroll element into view  ${xpath_for_state}
    Click Element  ${xpath_for_state}
    Press Keys   ${xpath_for_state}   ${state}
    Click Element  ${xpath_for_selection_state}
    Click Element  ${xpath_for_city}
    Press Keys   ${xpath_for_city}   ${city}
    Click Element  ${xpath_for_selection_city}
    ##################Button Related######################
    scroll element into view  ${xpath_for_btn_submit}
    click element  ${xpath_for_btn_submit}

     Sleep  5
     Close Browser


