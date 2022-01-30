*** Settings ***
Library       SeleniumLibrary
Library       Collections

*** Variables ***
${CART}        https://www.demoblaze.com/cart.html
${DELETE_BUTTON}          //*[contains(text(), "Delete")]
${PLACE_ORDER_BUTTON}         //*[@id="page-wrapper"]/div/div[2]/button
${TOTALPRICE_CART}       totalp
${TOTALPRICE_ONFORM}     totalm
${INPUTFIELD_NAME}       name
${INPUTFIELD_COUNTRY}      country
${INPUTFIELD_CITY}      city
${INPUTFIELD_CARD}      card
${INPUTFIELD_MONTH}      month
${INPUTFIELD_YEAR}      year
${PURCHASE_BUTTON}      //button[.//text() = 'Purchase']
${PURCHASE_SUCCESSFUL_MESSAGE}    Thank you for your purchase!
${PURCHASE_CONFIRM_BUTTON}     //button[.//text() = 'OK']
${PURCHASE_SUCCESSFUL_MESSAGE_CONTENT}     //html/body/div[10]/p
@{ORDER_DETAILS}   test  Spain  Barcelona  1234567890  12  2022

*** Keywords ***
Open cart
    Go To   ${CART}
    sleep  5

Delete item from cart
    [Arguments]   ${name}
    Open cart
    ${products}   Get list of products in cart
    ${length} =  Get Length  ${products}
    Run Keyword and return if  ${length} == 0  log  Cart is empty!
    ${list}   Get Webelements   ${DELETE_BUTTON}
    ${index} =	Get Index From List	 ${products}  ${name}
    Click element   ${list}[${index}]
    #sleep  5

Get list of products in cart
    Wait Until Element Is Visible   ${DELETE_BUTTON}  10  error=Cart is empty!
    @{list}   Create list
    sleep  5
    ${rows}   Get webelements  ${DELETE_BUTTON}
    ${length}  Set Variable  2
    FOR  ${row}  IN  @{rows}
    ${value}  Get Table Cell   class:table  ${length}  2
    ${length}  evaluate  ${length}+1
    Append to list   ${list}  ${value}
    END
    [Return]   ${list}

Click place order button
    Click element  ${PLACE_ORDER_BUTTON}
    Wait Until Element Is Visible   ${TOTALPRICE_ONFORM}


