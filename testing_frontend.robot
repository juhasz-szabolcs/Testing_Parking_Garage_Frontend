*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Login with valid credentials
    Open Browser    https://parking-garage-app.netlify.app/    Firefox
    Wait For Condition    return document.readyState == "complete"
    Click Element    //*[@id="login-link"]
    Wait Until Location Contains    /login    timeout=10s
    Input Text    //*[@id="email"]    juhaszszabolcs90@gmail.com
    Input Text    //*[@id="password"]    Audi
    Click Button    //*[@id="login-button"]
    Get Selenium Implicit Wait
    Sleep    4
    Page Should Contain    juhaszszabolcs90

    Sleep    2s
    Close Browser
