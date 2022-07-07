Feature: PUT Sample APIs

  Scenario: PUT API Demo1
    Given url 'https://reqres.in/api/users/2'
    And request {"name": "Shambhu","job": "tester"}
    When method PUT
    Then status 200
    And print response
