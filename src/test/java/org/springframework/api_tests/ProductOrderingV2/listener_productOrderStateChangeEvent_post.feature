# ********RoostGPT********

# Test generated by RoostGPT for test karateTest-product using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /listener/productOrderStateChangeEvent_post for http method type POST 
# RoostTestHash=2a8518ba6f
# 
# 

# ********RoostGPT********
Feature: State Change Event By Client

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase

  Scenario Outline: Validate state change event by client
    Given url urlBase
    And path '/listener/productOrderStateChangeEvent'
    And request <requestBody>
    When method post
    Then status <statusCode>
    And match response contains {description: <description>}

    Examples:
      | read('listener_productOrderStateChangeEvent_post.csv') |
