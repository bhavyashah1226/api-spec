# ********RoostGPT********

# Test generated by RoostGPT for test HSBC-HK-Market-Api-Spec using AI Type Azure Open AI and AI Model roostgpt-4-32k
# 
# Feature file generated for /aisp/accounts_get for http method type GET 
# RoostTestHash=b87a8a3304
# 
# 

# ********RoostGPT********
Feature: Validate 'accountStatus' endpoint
Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']
    * def headers = { 'Authorization' : '#('Bearer ' + authToken)', 'Accept-Language': 'en-HK', 'x-fapi-auth-date': 'Sun, 10 Sep 2017 19:43:31 UTC', 'x-fapi-customer-ip-address': '169.254.169.254', 'x-fapi-interaction-id': '#(java.util.UUID.randomUUID().toString())' }

Scenario Outline: Account Status
    Given path '/aisp/accounts'
    And headers headers
    When method get
    Then status <statusCode>
    And match responseHeaders contains { 'content-Type': '#string', 'x-fapi-interaction-id': '#string' }
    * def response = response
    And assert response.data.account contains { 'accountId': '#string', 'accountNumber': '#string', 'accountType': '#string', 'accountSubType': '#string', 'productName': '#string', 'accountStatus': '#string', 'currency': '#regex[A-Z]{3,3}' }
    And assert response.links contains { 'self': '#string' }

    Examples:
        | statusCode |
        | 200        |
        | 400        |
        | 401        |
        | 403        |
        | 405        |
        | 406        |
        | 429        |
        | 500        |
        | 503        |
        | 504        |
 