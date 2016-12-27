Feature: Users v2 API
  Get a list of users
  Update a specific user data
  Delete a specific user

  Scenario: List the users using GET users API
    When The client requests GET "users"
    Then The response should be a 200 OK
    And I get the first user id
    When The client requests GET details of a userid
    Then The response should be a 200 OK
    And The user response has below attributes
     | streamingVersion     |
     | pin                  |
     | streamingVersion     |
     | requiresPinDecision  |
     | hasContentRevocation |
     | createdAt            |
     | updatedAt            |

