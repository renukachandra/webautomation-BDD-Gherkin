*** Settings ***
Resource          ../pages/cart_page.robot
Resource          ../pages/product_page.robot

*** Keywords ***
Add item to cart
    Product page opened
    Add to cart button should be enabled
    Add to cart button clicked
    Go to home page

Validate item in cart
    [Arguments]    ${name}
    Open cart
    ${list}   Get list of products in cart
    List Should Contain Value   ${list}  ${name}

Validate item deleted from cart
    [Arguments]   ${name}
    Open cart
    Page Should Not Contain  ${name}

one item added to cart successfully
    [Arguments]   ${name}
    Open item description  ${name}
    Add item to cart
    Validate item in cart  ${name}

Validate price in cart and payment form
    ${expected_amount}  Get text  ${TOTALPRICE_CART}
    Click place order button
    ${amount2}  Get text  ${TOTALPRICE_ONFORM}
    Should contain   ${amount2}  ${expected_amount}  msg=Amount does not match!
    [Return]  ${expected_amount}

Input order details in form and submit
    Click place order button
    Input text   ${INPUTFIELD_NAME}       ${ORDER_DETAILS}[0]
    Input text   ${INPUTFIELD_COUNTRY}      ${ORDER_DETAILS}[1]
    Input text   ${INPUTFIELD_CITY}      ${ORDER_DETAILS}[2]
    Input text   ${INPUTFIELD_CARD}      ${ORDER_DETAILS}[3]
    Input text   ${INPUTFIELD_MONTH}      ${ORDER_DETAILS}[4]
    Input text   ${INPUTFIELD_YEAR}     ${ORDER_DETAILS}[5]
    Click element  ${PURCHASE_BUTTON}

Validate the success message
    Page should contain   ${PURCHASE_SUCCESSFUL_MESSAGE}

Validate price in success message
    ${expected_amount}  Get text  ${TOTALPRICE_CART}
    ${text}   Get text  ${PURCHASE_SUCCESSFUL_MESSAGE_CONTENT}
    Should contain  ${text}  Amount: ${expected_amount} USD
    Click element   ${PURCHASE_CONFIRM_BUTTON}

