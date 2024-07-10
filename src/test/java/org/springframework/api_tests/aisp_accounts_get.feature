# ********RoostGPT********

# Test generated by RoostGPT for test HSBC-HK-Market-Api-Spec using AI Type Azure Open AI and AI Model roostgpt-4-32k
# 
# Feature file generated for /aisp/accounts_get for http method type GET 
# RoostTestHash=b87a8a3304
# 
# 

# ********RoostGPT********
Feature: AISP Accounts

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * def token = karate.properties['AUTH_TOKEN']
    * def headers = { 'Authorization': 'Bearer ' + token, 'x-fapi-auth-date': 'Sun, 10 Sep 2017 19:43:31 UTC', 'x-fapi-customer-ip-address': '169.254.169.254', 'x-fapi-interaction-id': '#string', 'Accept-Language': 'en-HK', 'Content-Type': 'application/json' }
    * configure headers = headers

  Scenario Outline: Test GET /aisp/accounts with different status codes and validate the response
    Given path '/aisp/accounts'
    When method GET
    Then status <statusCode>
    And match responseHeaders['Content-Type'][0] == 'application/json'
    And match responseHeaders['x-fapi-interaction-id'][0] == '#string'
    # Validate response for 200 Status
    * def response200 = response.status == 200
    * if ('#(response200)') 
      match response contains { 'data': '#object' , 'links': {'self': '#string'} }
    # Validate response for error Status
    * def errorStatus = response.status != 200
    * if ('#(errorStatus)') 
      match response contains { 'id': '#string' , 'errors': '#array' }

    Examples:
      | statusCode |
      |        200 |
      |        400 |
      |        401 |
      |        403 |
      |        405 |
      |        406 |
      |        429 |
      |        500 |
      |        503 |
      |        504 |
