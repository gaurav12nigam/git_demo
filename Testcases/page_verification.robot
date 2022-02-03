*** Settings ***
Library     SeleniumLibrary
Variables    ../Library/locators.py

Suite Setup     open browser    ${url}  ${browser}
Suite Teardown    close browser

*** Variables ***
#${br}    chrome
#${url}    http://automationpractice.com/index.php?controller=authentication&back=my-account
${email}    ram24@gmail.com
${passwd}    123456
${ordertext}    Here are the orders you've placed since your account was created
${credittext}    Credit slips you have received after canceled orders
${myaddreestext}    Be sure to update your personal information if it has changed
${personalinfotext}    Please be sure to update your personal information if it has changed

*** Test Cases ***
menuvalidation
    maximize browser window
    wait until element is visible    ${xpath_for_sign_in}
    click element    ${xpath_for_sign_in}
    set selenium timeout    10secs
    Login
    VerifyOrderHistory
    Go back
    VerifyCreditslip
    Go back
    VerifyMyaddress
    Go back
    VerifyPersonalInfo
    Go back
    VerifyWishList
    close browser

*** Keywords ***
Login
    input text    ${id_for_email}    ${email}
    input password    ${id_for_passwd}    ${passwd}
    click button    ${xpath_for_submit}

VerifyOrderHistory
    click link    ${xpath_for_OrderHistory}
    wait until page contains    ${ordertext}
    sleep   2s

VerifyCreditslip
    click link    ${xpath_for_CreditSlips}
    wait until page contains    ${credittext}
    sleep   2s

VerifyMyaddress
    click link    ${xpath_for_Myaddress}
    wait until page contains    ${myaddreestext}
    sleep   2s

VerifyPersonalInfo
    click link    ${xpath_for_PersonalInfo}
    wait until page contains    ${personalinfotext}
    sleep   2s

VerifyWishList
    click link    ${xpath_for_WishList}
    sleep   2s