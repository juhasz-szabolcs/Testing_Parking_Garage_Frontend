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

    # Szöveg kijelölése JavaScript segítségével
    ${selection_script}=    Catenate    SEPARATOR=\n
    ...    function selectText() {
    ...        const xpath = "/html/body/div/main/div/div[1]/p[2]";
    ...        const element = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...        
    ...        if (element) {
    ...            const selection = window.getSelection();
    ...            const range = document.createRange();
    ...            range.selectNodeContents(element);
    ...            selection.removeAllRanges();
    ...            selection.addRange(range);
    ...            return true;
    ...        }
    ...        return false;
    ...    }
    ...    return selectText();
    
    Execute JavaScript    ${selection_script}
    Sleep    2s
    
    Execute JavaScript    ${selection_script}
    Sleep    2s
    Close Browser
