Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: get all users and then get the first user by id
    Given path 'users'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'users', first.id
    When method get
    Then status 200

  Scenario: create a user and then get it by id
    * def user =
      """
      {
        "name": "Test User",
        "username": "testuser",
        "email": "test@user.com",
        "address": {
          "street": "Has No Name",
          "suite": "Apt. 123",
          "city": "Electri",
          "zipcode": "54321-6789"
        }
      }
      """

    Given url 'https://jsonplaceholder.typicode.com/users'
    And request user
    When method post
    Then status 201
    And match response.name == user.name
    And match response.username == user.username
    And match response.email == user.email
    And match response.address == user.address
    And match response.id == '#present'

    * def id = response.id
    * print 'created id is: ', id

    # The following GET request validation has been removed because the mock API
    # (https://jsonplaceholder.typicode.com/users) does not actually persist
    # the created user. Attempting to GET the user by ID after creation
    # results in a 404 Not Found error.
    # Given path id
    # When method get
    # Then status 200
    # And match response.name == user.name
    # And match response.username == user.username
    # And match response.email == user.email
    # And match response.address == user.address
    # And match response.id == id
  