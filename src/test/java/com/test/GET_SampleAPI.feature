Feature: First APIs Tests

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  # GET without Background
  Scenario: Test a sample GET APIs 1
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseCookies
    And print responseHeaders

  # GET with Background and Path
  Scenario: Test a sample GET APIs 2
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response

  # GET with Background, path and params
  Scenario: Test a sample GET APIs 3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].id == 7
    * match response.data[0].first_name != null
    And assert response.data[3].id == 10
    And match $.data[0].id == 7

  # GET with Background, path, params and Assertion
  Scenario: Test a sample GET APIs 4
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
