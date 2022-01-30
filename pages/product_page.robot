*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${ADDTOCART_BUTTON}        //*[@id="tbodyid"]/div[2]/div/a
${POPUP_MESSAGE}           Product added
${HOME_TAB}                //*[@id="navbarExample"]/ul/li[1]/a

*** Keywords ***
Product page opened
  Wait Until Element Is Visible     ${ADDTOCART_BUTTON}
  Element Should Be Visible         ${ADDTOCART_BUTTON}

Add to cart button clicked
  Wait Until Element Is Enabled     ${ADDTOCART_BUTTON}
  Click Element                     ${ADDTOCART_BUTTON}
  Pop-up should be displayed

Add to cart button should be enabled
  Wait Until Element Is Enabled     ${ADDTOCART_BUTTON}
  Element Should Be Enabled         ${ADDTOCART_BUTTON}

Pop-up should be displayed
    Alert Should Be Present     ${POPUP_MESSAGE}

Go to home page
    Click Element  ${HOME_TAB}