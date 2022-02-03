*** Settings ***
Library     SeleniumLibrary
Variables      ../Library/locators.py

Suite Setup       open browser    ${url}     ${browser}
Suite Teardown    close browser

*** Variables ***
${email}    ram24@gmail.com
${passwd}    123456
${search_product}    dress
${product_added}    Product successfully added to your shopping cart
${page_title}    Order - My Store
${delivery_page}    Delivery address
${billing_page}    Your billing address
${shipping_page}    Shipping
${payment_page}    Please choose your payment method

*** Test Cases ***
Login
    maximize browser window
    wait until element is visible    ${xpath_for_sign_in}
    click element    ${xpath_for_sign_in}
    input text    ${id_for_email}    ${email}
    input password    ${id_for_passwd}    ${passwd}
    click button    ${xpath_for_submit}

Selecting Item
    Select The Item
    Item Qauntity     2
    Selecting the size
    Adding To Cart
    Verify Cart
    Verify Address
    Verify Shipping Mode

*** Keywords ***
Select The Item
    input text   ${xpath_serchBox}      ${search_product}
    click element    ${xpath_search}
    Mouse Down     ${xpath_dress_slt}
    sleep   2s
    click element   ${xpath_select_item}

Item Qauntity
    [Arguments]      ${quantity}
    input text    ${xpath_select_qty}        ${quantity}

Selecting the Size
    ${sizes}=     Get List Items    ${xpath_select_size}
    Log    ${sizes}
    Select From List By Index    ${xpath_select_size}     1
    click element     ${xpath_select_color}
    sleep    2s

Adding To Cart
    wait until page contains element      ${xpath_cart_submit}
    click element   ${xpath_cart_submit}
    page should contain      ${product_added}   30s
    sleep   3s
    click element   ${close_window}

Verify Cart
    click element   ${xpath_view_cart}
    title should be         ${page_title}
    page should contain     ${delivery_page}
    Mouse Down     ${xpath_checkout}
    click element     ${xpath_checkout}

Verify Address
    page should contain      ${billing_page}
    Mouse Down    ${xpath_checkout_billing}
    sleep   2s
    click element   ${xpath_checkout_billing}

Verify Shipping Mode
    page should contain    ${shipping_page}
    Mouse Down    ${xpath_checkout_payment}
    sleep    2s
    select checkbox    ${xpath_checkbox}
    click element    ${xpath_checkout_payment}
    page should contain     ${payment_page}
    Mouse Down    ${payment_method}
    sleep     2s
    click element    ${xpath_for_payment_mode}
    execute javascript    window.scrollTo(0,1000)
    click element    ${xpath_for_confirm_payment}
    Mouse Down    ${xpath_for_ord_dtl}
    sleep      5s