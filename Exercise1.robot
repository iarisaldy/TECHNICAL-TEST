*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}   chrome
${url}  https://www.ebay.com/
${result}   4.0 - 4.4 Inch Cell Phones & Smartphones between IDR1,000,000.00 and IDR3,000,000.00
${filter}   /html/body/div[5]/div[2]/h1/span
${keyword}  macbook
${verif}  //*[@id="mainContent"]/div[1]/div/div[2]/div[1]/div[1]/h1/span[2]



***Keywords***
Open Ebay
    open browser    ${url}    ${browser}
    maximize browser window

is equal 
    [Arguments]     ${a}    ${b}
    Should be equal     ${a}    ${b}    Custom error    values=True

Validate product by filter
    wait until element is visible   ${filter}}      timeout=60
    ${filter_result}}      get text    ${filter}
    is equal    ${result}   ${filter_result}

Validate product by keyword
    wait until element is visible   ${verif}      timeout=60
    ${name}      get text    ${verif}
    is equal    ${keyword}   ${name}

*** Test Cases ***
Access a Product via category after applying multiple filters
    Open Ebay
    click element   id=gh-cat   #click element option value
    click element   //*[@id="gh-cat"]/option[8]   #click Cell Phones & Accessories
    click element   id=gh-btn   #button search
    click element   //*[@id="s0-16-12_2-0-1[0]-0-0"]/ul/li[3]/a   #click Cell Phones & Smartphones
    sleep    5s
    click element    xpath=//section[@id='s0-27_1-9-0-1[1]-0-0']/section/ul/li[9]/button  #click all filter
    wait until element is visible   xpath=//div[@id='c3-mainPanel-Screen%20Size']/span   timeout=60
    click element   xpath=//div[@id='c3-mainPanel-Screen%20Size']/span  #click filter Screen size
    wait until element is visible   id=c3-subPanel-Screen%20Size_4.0%20-%204.4%20in_cbx   timeout=60
    click element   id=c3-subPanel-Screen%20Size_4.0%20-%204.4%20in_cbx    #click Screen size 4.0 - 4.4
    click element   id=c3-mainPanel-price   #click filter price
    wait until element is visible   xpath=//div[@id='c3-subPanel-_x-price-textrange']/div/div/div/input   timeout=60
    click element   xpath=//div[@id='c3-subPanel-_x-price-textrange']/div/div/div/input  #click filter price text range
    input text    xpath=//div[@id='c3-subPanel-_x-price-textrange']/div/div/div/input    1000000    #input range IDR 1.000.000
    click element  xpath=//div[@id='c3-subPanel-_x-price-textrange']/div/div[2]/div/input   #click filter price text range
    input text    xpath=//div[@id='c3-subPanel-_x-price-textrange']/div/div[2]/div/input    3000000     #input range IDR 3.000.000
    click element   xpath=//div[@id='c3-mainPanel-location']/span   #click filter Location
    wait until element is visible   xpath=//div[@id='c3-subPanel-location_Asia']/label/input  timeout=60
    click element   xpath=//div[@id='c3-subPanel-location_Asia']/label/input    #click Asia
    click element    xpath=//form[@id='x-overlay__form']/div[3]/div[2]/button   #click button filter
    Validate product by filter
    capture page screenshot
    close browser

Access a Product via Search
    Open Ebay
    input text  id=gh-ac    ${keyword}  #input text from kolom search
    click element   //*[@id="gh-cat"]/option[14]    #click button search
    click element   id=gh-btn   #button search
    #verifikasi search
    Validate product by keyword
    #screenshot layar
    capture page screenshot            
    close browser