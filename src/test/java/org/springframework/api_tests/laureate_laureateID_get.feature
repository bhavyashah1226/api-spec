# ********RoostGPT********

# Test generated by RoostGPT for test karateNobel using AI Type Azure Open AI and AI Model roostgpt-4-32k
# 
# Feature file generated for /laureate/{laureateID}_get for http method type GET 
# RoostTestHash=e702c0f931
# 
# 

# ********RoostGPT********
Feature: Testing Laureate API functionality
  Scenario: Obtain information about a particular Nobel Prize Laureate
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:8080')
    * url urlBase 
    * configure headers = { 'Content-Type': 'application/json', 'Authorization': '#(authToken)' }
  
    Examples:
      | laureateID |
      | 10         |
      | 100        |
      | 456        |
    
    Scenario: Verify correct responses for valid laureate IDs
      Given path '/2.1/laureate/', laureateID
      When method GET
      Then status 200
      And match each response contains { 'id': '#number' }
      And match each response.laureate contains { 'id': '#number' }
  
    Scenario: Verify error messages for invalid laureate IDs
      Given path '/2.1/laureate/', laureateID
      When method GET
      Then status 400
      And match response contains { 'code': '404' }
    
    Scenario: Verify error messages for nonexistent laureate IDs
      Given path '/2.1/laureate/', laureateID
      When method GET
      Then status 404
      And match response contains { 'code': '404' }       
