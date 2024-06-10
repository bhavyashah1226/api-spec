# ********RoostGPT********

# Test generated by RoostGPT for test karateTest-product using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /listener/productOrderInformationRequiredEvent_post for http method type POST 
# RoostTestHash=99e96e3191
# 
# 

# ********RoostGPT********
Feature: Product Order Information Required Event

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * def authHeader = {Authorization: '#(karate.properties['AUTH_TOKEN'])'}

  Scenario Outline: Verify RESTful API for Product Order Information Required Event
    Given path '/listener/productOrderInformationRequiredEvent'
    And headers authHeader
    And request '<requestBody>'
    When method post
    Then status <responseStatus>
    And match response == '<responseBody>'

    Examples:
      | read('listener_productOrderInformationRequiredEvent_post.csv') |
