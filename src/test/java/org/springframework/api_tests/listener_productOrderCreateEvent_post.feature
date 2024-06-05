# ********RoostGPT********

# Test generated by RoostGPT for test karateTest-product using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /listener/productOrderCreateEvent_post for http method type POST 
# RoostTestHash=10f12a7f6a
# 
# 

# ********RoostGPT********
Feature: Product Order Create Event By Client

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase

  Scenario Outline: Validate Product Order Create Event API
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method post
    Then status <status>
    And match response == <response>

    Examples:
      | read('listener_productOrderCreateEvent_post.csv') |
