# ********RoostGPT********

# Test generated by RoostGPT for test karateTest-product using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /productOrder_post for http method type POST 
# RoostTestHash=d2b09bfc44
# 
# 

# ********RoostGPT********
Feature: Test /productOrder API

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase

  Scenario Outline: Test POST /productOrder API with valid input
    Given path '/productOrder'
    And request
      """
      <requestBody>
      """
    When method post
    Then match responseStatus == <responseStatus>
    And match response ==
      """
      <responseBody>
      """

    Examples:
      | read('productOrder_post.csv') |
