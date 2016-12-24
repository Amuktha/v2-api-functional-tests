Feature: Users v2 API
  Get a list of users
  Update a specific user data
  Delete a specific user

  Scenario: List the users using GET users API
    When The client requests GET "users"
    Then The response should be a 200 OK
