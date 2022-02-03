*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${fname}  Gaurav
${lname}  Nigam
${email}  gaurav.nigam@gmail.com
${contact}  9874563201
${adrs}  A-24,Lucknow Uttar Pradesh
${gender}  Male
${hb1}  Sports
${file_path}  C:\\Users\\gaurav\\Desktop\\gaurav-nigam.jpg

*** Test Cases ***
MyTest
    [documentation]  Google Test
    [tags]  Regression

    Open Browser  https://demoqa.com/automation-practice-form  chrome

     ##############check box##################
     #Click Element  hobbies-checkbox-1
     #select checkbox  id:hobbies-checkbox-1
        sleep  5
        Click Element  //div[contains(text(),"Select State")]
        Press Keys  //*[@id="state"]/div/div[1]/div[1]  Uttar
        click element  xpath=//div[@id='react-select-3-option-0']
        #xpath=//div[@id='react-select-2-option-0']
       # scroll element into view  xpath=//*[@id="submit"]
        #select checkbox  //*[@id="hobbiesWrapper"]/div[2]/div[1]/label
       # select checkbox  //*[@id="hobbiesWrapper"]//div[2]//div[1]//label
        #Select From List By Value  xpath=//*[@id="state"]/div/div[1]/div[1]  NCR
        #//*[@id="state"]/div/div[1]/div[1]
        #//*[@id="react-select-3-input"]
        #//*[@id="state"]/div/div[1]/div[1]
     ########################################

     Sleep  5
     Close Browser


