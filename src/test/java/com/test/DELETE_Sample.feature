Feature: Delete APIs Tests

  # GET without Background
  Scenario: Test a sample Delete APIs 1
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204
    And print response