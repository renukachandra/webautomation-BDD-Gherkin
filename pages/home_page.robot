*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${DB_LOGO}         id=nava
${NEXT_PAGE}       next2

*** Keywords ***
Home Page Opened
    Wait Until Element Is Visible    ${DB_LOGO}
    Element Should Be Visible        ${DB_LOGO}

Open item description
    [Arguments]   ${name}
    ${visible}   Run keyword and return status   Page Should Contain    ${name}
    Run keyword if  not ${visible}  Natigate to next page
    Wait Until page contains  ${name}
    Click Element     xpath://*[contains(text(), "${name}")]

Natigate to next page
    Click Element   ${NEXT_PAGE}