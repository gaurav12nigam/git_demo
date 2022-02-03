*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://demoqa.com/automation-practice-form
${browser_name}  chrome
${fname}  Gaurav
${lname}  Nigam
${email}  gaurav.nigam@gmail.com
${contact}  9874563201
${adrs}  A-24,Lucknow Uttar Pradesh
${gender}  Male
${hb1}  Sports
${hb2}  Music
${file_path}  C:\\Users\\gaurav\\Desktop\\gaurav-nigam.jpg
${subject}  computer
${state}  Uttar Pradesh
${city}  Lucknow

*** Test Cases ***
MyTest
    [documentation]  Registration Automation
    [tags]  Regression
    ##################Browser Related#################################
    Open Browser    ${url}  ${browser_name}
    maximize browser window
    sleep  5
    #############################################
    Input Text  xpath=//*[@id="firstName"]  ${fname}
    Input Text  xpath=//*[@id="lastName"]  ${lname}
    Input Text  xpath=//*[@id="userEmail"]  ${email}
    Input Text  xpath=//*[@id="userNumber"]  ${contact}
    Input Text  xpath=//*[@id="currentAddress"]  ${adrs}

    ##########Radio Button##################
    Click Element  //div[@id="genterWrapper"]//following::label[text()='${gender}']

    #select radio button  gender  ${gender}
    #################File-upload#############
     choose file   //*[@id="uploadPicture"]  ${file_path}

    ##############subjects#########################
    Press Keys  //*[@id="subjectsContainer"]/div  ${subject}
    click element  xpath=//div[@id='react-select-2-option-0']
    ##############check box##################
     scroll element into view  xpath=//*[@id="hobbies-checkbox-1"]
     Click Element  //*[@id="hobbiesWrapper"]//following::label[text()='${hb1}']
     Click Element  //*[@id="hobbiesWrapper"]//following::label[text()='${hb2}']
     ##############List box##################
      sleep  5
      Click Element  //*[@id="state"]/div/div[1]/div[1]
      Press Keys  //*[@id="state"]/div/div[1]/div[1]   ${state}
      #Click Element  //*[@id="state"]/div/div[1]
      sleep  5
      Click Element  //*[@id="city"]/div/div[1]/div[1]
      Press Keys  //*[@id="city"]/div/div[1]/div[1]   ${city}
     ##################Button Related######################
     sleep  5
     scroll element into view  xpath=//*[@id="submit"]
     click element  xpath=//*[@id="submit"]

     Sleep  5
     Close Browser


