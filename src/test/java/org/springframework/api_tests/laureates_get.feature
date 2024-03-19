# ********RoostGPT********

# Test generated by RoostGPT for test karateNobel using AI Type Azure Open AI and AI Model roostgpt-4-32k
# 
# Feature file generated for /laureates_get for http method type GET 
# RoostTestHash=ff433d7857
# 
# 

# ********RoostGPT********
Feature: Test /2.1/laureates endpoint

Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase
    * def authHeader = { Authorization: '#(authToken)' }
    * configure headers = authHeader

Scenario Outline: Get Laureates data with different query parameters
    Given path '/2.1/laureates'
    And param offset = '<offset>'
    And param limit = '<limit>'
    And param gender = '<gender>'
    When method get
    Then status 200
    And match response.laureates[*].gender contains '<gender>'

    Examples:
        | offset | limit | gender |
        | 1      | 10    | male   |
        | 2      | 12    | female |
        | 3      | 14    | male   |

Scenario: Test invalid request parameters
    Given path '/2.1/laureates'
    And param offset = 'x'
    When method get
    Then status 400
  
Scenario: Test resource not found
    Given path '/2.1/unknown'
    When method get
    Then status 404 

Scenario: Verify Laureates data model
    Given path '/2.1/laureates'
    And params { offset: 1, limit: 1 }
    When method get
    Then status 200
    And match each response.laureates contains 
    {
      id: '#number',
      birth: {
        date: '#string',
        birthCity: '#string',
        birthCountry: '#string',
        birthContinent: '#string'
      },
      death: {
        date: '#string',
        deathCity: '#string',
        deathCountry: '#string',
        deathContinent: '#string'
      },
    }
