*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${MAIN_PAGE}      https://www.demoblaze.com/index.html

*** Keywords ***
Open Main Page Using Chrome Browser
  Open Browser    ${MAIN_PAGE}    Chrome
  Maximize Browser Window
