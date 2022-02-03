*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library     OperatingSystem
Library     ../Automation_Robot/price_extraction.py
Variables   ../Library/site_locators.py

Suite Setup     open browser    ${url}  ${browser}
Suite Teardown    close browser

*** Variables ***
@{price_list}

*** Test Cases ***
Opening Landing Page and Sign Page
    [Documentation]     This Testcase is used to verify successful opening of Home Page and then click on Sign IN
    [Tags]      Login
    maximize browser window
    wait until element is visible    ${xpath_for_sign_in}
    click element    ${xpath_for_sign_in}
    wait until element is visible      ${xpath_for_email}
    scroll element into view    ${xpath_for_sign_in_btn}

Validating Login Details
    [Documentation]     This testcase is for login credentials
    [Tags]              Login
    input text          ${xpath_for_email}      driving@biz.com
    input text          ${xpath_for_password}   test01
    click element       ${xpath_for_sign_in_btn}
    wait until element is visible   ${xpath_for_header}

Navigate To Service Page
    [Documentation]     This testcase is for navigating to service page
    [Tags]              Service
    Click Element       ${xpath_for_services}
    wait until element is visible   ${xpath_for_service_header}


Extract Price from Table
    [Documentation]     Testcase for extracting price in Service Page
    [Tags]              Price
    ${rowCount}=    Get Element Count    ${xpath_for_table_row}
    ${colCount}=    Get Element Count    ${xpath_for_table_col}
    FOR   ${rowIndex}     IN RANGE     1      ${rowCount}
         #Nested loop  ${rowIndex}   ${colCount}
         ${price}      Get Text     ${xpath_for_table}/tbody/tr[${rowIndex}]/td[6]
         Append To List  ${price_list}  ${price}
    END
    Log     ${price_list}

Conversion of Prices
    [Documentation]     Testcase for conversion of prices
    [Tags]              Price
    @{lst}=         Price Extraction    ${price_list}
    Log     ${lst}

Performing If Else Operation
    [Documentation]     Testcase for conversion of prices
    [Tags]              Price


Create New Service
    [Documentation]     Testcase for creating New Service
    [Tags]              Service
    Click Element       ${xpath_for_service_creation}
    ${json}=     OperatingSystem.Get File    C:\\Users\\gaurav\\PycharmProjects\\pythonProject1\\Library\\data.json
    wait until element is visible   ${xpath_for_new_service_header}
    ${object}=    Evaluate  json.loads('''${json}''')    json
    log     ${object}
    input text          ${xpath_for_service_name}      ${object[0]['service_name']}
    input text          ${xpath_for_service_code}   ${object[0]['UCode']}
    input text          ${xpath_for_service_price}   ${object[0]['price']}
    Click Element       ${xpath_for_check_box1}
    Click Element       ${xpath_for_check_box2}
    Click Element       ${xpath_for_check_box3}
    #Sleep           4
    Click Element       ${xpath_for_service_btn}





