Feature: Login Load Test

  Background:
    * url 'https://api.cipla.stage.platform.leucinetech.com/v1'
    * def password = 'JHVuRGF5MTIz'
    * configure headers = 
    """
    {
      'accept': 'application/json, text/plain, */*',
      'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
      'access-control-allow-origin': '*',
      'cache-control': 'no-cache',
      'content-type': 'application/json',
      'pragma': 'no-cache',
      'sec-ch-ua': '"Not(A:Brand";v="99", "Google Chrome";v="133", "Chromium";v="133"',
      'sec-ch-ua-mobile': '?0',
      'sec-ch-ua-platform': '"Windows"',
      'sec-fetch-dest': 'empty',
      'sec-fetch-mode': 'cors',
      'sec-fetch-site': 'same-site'
    }
    """

  Scenario Outline: Login with user <username>
    Given path '/auth/login'
    And request { username: '#(username)', password: '#(password)' }
    When method POST
    Then status 200
    And match response contains { token: '#notnull' }

    Examples:
      | read('users.csv') |
