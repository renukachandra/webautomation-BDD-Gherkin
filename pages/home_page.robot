*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${DB_LOGO}         id=nava
${NEXT_PAGE}       next2
${ITEM_TYPE_PHONES}   //*[@id="itemc"][1]
${ITEM_TYPE_LAPTOPS}   //*[@id="itemc"][2]
${ITEM_TYPE_MONITORS}   //*[@id="itemc"][3]

*** Keywords ***
Home Page Opened
    Wait Until Element Is Visible    ${DB_LOGO}
    Element Should Be Visible        ${DB_LOGO}

Open item description
    [Arguments]   ${name}
    Navigate to Laptops category
    ${visible}   Run keyword and return status   Page Should Contain    ${name}
    Run keyword if  not ${visible}  Natigate to next page
    Wait Until page contains  ${name}
    Click Element     xpath://*[contains(text(), "${name}")]

Navigate to Laptops category
    Click Element   ${ITEM_TYPE_LAPTOPS}

Navigate to Phones category
    Click Element   ${ITEM_TYPE_PHONES}

Navigate to Monitors category
    Click Element   ${ITEM_TYPE_MONITORS}

Natigate to next page
    Click Element   ${NEXT_PAGE}