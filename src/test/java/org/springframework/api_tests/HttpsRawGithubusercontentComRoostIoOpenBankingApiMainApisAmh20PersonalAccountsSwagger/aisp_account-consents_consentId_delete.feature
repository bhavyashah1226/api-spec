# ********RoostGPT********

# Test generated by RoostGPT for test karateTest-product using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /aisp/account-consents/{consentId}_delete for http method type DELETE 
# RoostTestHash=ac51f8b6e8
# 
# 

# ********RoostGPT********
Feature: Account Consent Setup

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']
    * def headers = { 'Authorization': '#('Bearer ' + authToken)', 'x-fapi-auth-date': 'Sun, 10 Sep 2017 19:43:31 UTC', 'x-fapi-customer-ip-address': '169.254.169.254', 'x-fapi-interaction-id': '', 'Accept-Language': '' }

  Scenario Outline: Consent Deletion
    Given path '/aisp/account-consents/', '<consentId>'
    And headers headers
    When method delete
    Then match responseStatus == <expectedResponseStatus>
    And match responseHeaders['x-fapi-interaction-id'] == '#string'
    And match each response.errors[*].code == '#string'
    And match each response.errors[*].causes == '#string'
    And match each response.errors[*].extendedDetails.path == '#string'

    Examples:
      | read('aisp_account-consents_consentId_delete.csv') |
