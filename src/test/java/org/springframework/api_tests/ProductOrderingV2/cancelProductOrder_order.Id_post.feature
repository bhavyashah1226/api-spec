# ********RoostGPT********

# Test generated by RoostGPT for test karateTest-product using AI Type Open AI and AI Model gpt-4
# 
# Feature file generated for /cancelProductOrder/{order.Id}_post for http method type POST 
# RoostTestHash=f9512deb98
# 
# 

# ********RoostGPT********
Feature: Cancel Order

  Background:
    * def urlBase = karate.properties['url.base'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * def authToken = karate.properties['AUTH_TOKEN']
    * header Authorization = authToken

  Scenario Outline: Cancel Product Order By Id
    Given path '/cancelProductOrder', '<order.Id>'
    And request
      """
      { 
        "order": { 
          "associatedDocument": "<associatedDocument>", 
          "customer": { 
            "subscriberId": "<subscriberId>" 
          } 
        } 
      }
      """
    When method post
    Then status <status_code>
    And match response ==
      """
      { 
        "control": { 
          "type": "<type>", 
          "code": "<code>", 
          "message": "<message>" 
        } 
      }
      """

    Examples:
      | read('cancelProductOrder_order.Id_post.csv') |
