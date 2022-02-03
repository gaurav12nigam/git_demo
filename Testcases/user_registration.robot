*** Settings ***
Library    SeleniumLibrary
Library    XML
Variables    ../Library/locators.py

Suite Setup     open browser    ${url}  ${browser}
Suite Teardown    close browser

*** Test Cases ***
User_SignUp
    [Documentation]    Test case to register the user.
    [Tags]    regression
    ${xml_obj}  parse xml    Library/data.xml
    ${email}=   get element text    ${xml_obj}  .//user[2]/email
    ${title}=   get element text    ${xml_obj}  .//user[1]/title
    ${firstname}=   get element text    ${xml_obj}  .//user[1]/firstname
    ${lastname}=   get element text    ${xml_obj}  .//user[1]/lastname
    ${password}=   get element text    ${xml_obj}  .//user[1]/password
    ${address}=   get element text    ${xml_obj}  .//user[1]/address
    ${city}=   get element text    ${xml_obj}  .//user[1]/city
    ${state}=   get element text    ${xml_obj}  .//user[1]/state
    ${zip}=   get element text    ${xml_obj}  .//user[1]/zip
    ${mobile}=   get element text    ${xml_obj}  .//user[1]/mobile

    maximize browser window
    wait until element is visible    ${xpath_for_sign_in}
    click element    ${xpath_for_sign_in}
    input text    ${xpath_for_email}   ${email}
    click element    ${id_for_create_account_btn}
    wait until element is visible    ${xpath_for_header}    20s
    sleep    5s

    run keyword if    '${title}' == 'Mr'     select title for mr
    ...    ELSE    select title for mr

    input text    ${id_for_first_name}  ${firstname}
    input text    ${id_for_last_name}  ${lastname}
    input text    ${id_for_pwd}  ${password}
    click element    ${id_for_news_ltr}
    input text    ${id_for_address_first_name}  ${firstname}
    input text    ${id_for_address_last_name}  ${lastname}
    input text    ${id_for_address}  ${address}
    input text    ${id_for_city}  ${city}
    scroll element into view    ${id_for_city}
    input text    ${id_for_zip}  ${zip}
    input text    ${id_for_mobile}  ${mobile}
    select from list by label    ${id_for_state}    California
    click element    ${id_for_reg_btn}
    wait until element is visible    ${xpath_for_logout}    30s
    sleep    5s

*** Keywords ***
select title for mr
    click element    ${id_for_mr}

select title for mrs
    click element    ${id_for_mrs}