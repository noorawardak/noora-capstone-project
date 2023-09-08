Feature: Create Account End To End

  @TestKarate
  Scenario: End to End Testing
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username" : "supervisor" , "password" : "tek_supervisor"}
    When method post
    And url "https://tek-insurance-api.azurewebsites.net"
    And request
      """
      {
      "email": "#(autoEmail)",
      "firstName": "noora",
      "lastName": "wardak",
      "title": "Ms.",
      "gender": "FeMALE",
      "maritalStatus": "SINGLE",
      "employmentStatus": "Software Developer",
      "dateOfBirth": "2001-04-14"
      }
      """
    And path "/api/accounts/add-add-phone"
    And param primaryPersonId = createAccountId
    And header Autorization = "Bearer " +  validToken
    And path "/api/accounts/add-account-address"
    And param primaryPersonId = createAccountId
    And request
      """
      
      {
      "id": 0,
      "addressType": "2434",
      "addressLine1": "home",
      "city": "DC",
      "state": "Virgina",
      "postalCode": "332",
      "countryCode": "+12",
      "current": true
      }
      """
    And Path "/api/accounts/add-accont-car"
    And param primaryPersonId = createAccountId
      """
      {
      "id": 0,
      "make": "toyota",
      "model": "38c",
      "year": "2012",
      "licensePlate": "2134"
      }
      """
    And path "/api/accounts/delete-account"
    And param primaryPersonId = createAccountId
    Then status 200
    And print response
