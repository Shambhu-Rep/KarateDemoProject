Feature: Post APIs

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')

  # Sample POST request
  Scenario: POST Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "Sham","job": "Engg"}
    When method POST
    Then status 201
    And print response

  # Sample POST request with Background
  Scenario: POST Demo 2
    Given path '/users'
    And request {"name": "Sham1","job": "Engg1"}
    When method POST
    Then status 201
    And print response

  # Sample POST request with Background, Assertion
  Scenario: POST Demo 3
    Given path '/users'
    And request {"name": "Sham1","job": "Engg1"}
    When method POST
    Then status 201
    And match response == {"name": "Sham1","job": "Engg1","id": "#string","createdAt": "#ignore"}
    And print response

  # Sample POST request with Background, Assertion with external file
  Scenario: POST Demo 4
    Given path '/users'
    And request {"name": "Sham12","job": "Engg12"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

  # Sample POST request with read json request from external file
  Scenario: POST Demo 5
    Given path '/users'
    * def requestBody = read('POST_request.json')
    And request requestBody
    When method POST
    Then status 201
    And match response == {"name": "karate","job": "test","id": "#string","createdAt": "#ignore"}
    And print response
    
     # Sample POST request with read json request from external file and SET function
  Scenario: POST Demo 6
    Given path '/users'
    * def requestBody = read('POST_request.json')
    And set requestBody.job = 'testing'
    And request requestBody
    When method POST
    Then status 201
    And match response == {"name": "karate","job": "testing","id": "#string","createdAt": "#ignore"}
    And print response
