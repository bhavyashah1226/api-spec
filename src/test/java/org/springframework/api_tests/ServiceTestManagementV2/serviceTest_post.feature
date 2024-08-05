# ********RoostGPT********

# Test generated by RoostGPT for test karateTest-product using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /serviceTest_post for http method type POST 
# RoostTestHash=a0badb7b73
# 
# 

# ********RoostGPT********
Feature: Service Test API

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * def authHeader = { Authorization: '#(karate.properties['AUTH_TOKEN'])' }
    * configure headers = authHeader

  Scenario Outline: Testing Service Test API with different inputs
    Given path '/serviceTest'
    And request
      """
      <requestBody>
      """
    When method post
    Then status <statusCode>
    And match response ==
      """
      <responseBody>
      """

    Examples:
      | read('serviceTest_post.csv') |
