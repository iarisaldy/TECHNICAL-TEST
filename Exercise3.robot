*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  RequestsLibrary

*** Variable ***
${url_api_Get}=         https://run.mocky.io/v3/e016e8b1-4b45-4499-858c-f15218dd8b82
${url_api_Post}=        https://run.mocky.io/v3/67b6fff2-0e07-4ab4-b79b-0b0ac657a25a
${url_api_Error_400}=   https://run.mocky.io/v3/f1449421-eb12-48ce-98f4-f51cc1e15a5c
${url_api_Error_404}=   https://run.mocky.io/v3/1df3567f-f33c-4fa6-8a16-3fc5ccf597ab 
${url_api_Error_500}=   https://run.mocky.io/v3/94caa353-fd21-4bb7-9f7c-27643a2b6be5

${body_get}=    {'prefix': 'PT', 'name': 'Sejahtera', 'suffix': 'Tbk', 'industry_id': '1', 'employee_size': '500', 'street': 'Jl.Sudirman kav. 21', 'place': 'Sudirman Tower', 'geograph_id': 100, 'phone': '08561290092'}
${body_error_400}=  {'status': 'Error 400 Bad Request'}
${body_error_404}=  {'Error code': '404 Not Found'}
${body_error_500}=  {'Error Code': 'Error 500 Internal Server Error'}

*** Test Case ***
Get_Data
    Create Session    Get_data    ${url_api_Get}
    ${resp}=   GET On Session  Get_data  /  expected_status=200

    #validate status and respons
    Should Be Equal As Strings          ${resp.reason}  OK
    Should Be Equal As Strings          ${resp.json()}  ${body_get}

Post_Data
    Create Session    Post_data    ${url_api_Post}
    ${resp}=   POST On Session  Post_data  /  expected_status=200

    #validate
    Should Be Equal As Strings          ${resp.reason}  OK

Get_Data_Error 400 Bad Request 
    Create Session    Get_data_Error_400    ${url_api_Error_400}
    ${resp}=   GET On Session  Get_data_Error_400  /  expected_status=400

    #validate status and respons
    Should Be Equal As Strings          ${resp.reason}  Bad Request 
    Should Be Equal As Strings          ${resp.json()}  ${body_error_400}

Get_Data_Error 404 Not Found
    Create Session    Get_data_Error_404    ${url_api_Error_404}
    ${resp}=   GET On Session  Get_data_Error_404  /  expected_status=404

    #validate status and respons
    Should Be Equal As Strings          ${resp.reason}  Not Found 
    Should Be Equal As Strings          ${resp.json()}  ${body_error_404}

Get_Data_Error 500 Internal Server Error
    Create Session    Get_data_Error_500    ${url_api_Error_500}
    ${resp}=   GET On Session  Get_data_Error_500  /  expected_status=500

    #validate status and respons
    Should Be Equal As Strings          ${resp.reason}  Internal Server Error
    Should Be Equal As Strings          ${resp.json()}  ${body_error_500}