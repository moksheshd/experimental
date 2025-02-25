Feature: Facility Switch Load Test

  Background:
    * url 'https://api.cipla.stage.platform.leucinetech.com/v1'
    * configure headers = 
    """
    {
      'accept': 'application/json, text/plain, */*',
      'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
      'access-control-allow-origin': '*',
      'cache-control': 'no-cache',
      'pragma': 'no-cache',
      'sec-ch-ua': '"Not(A:Brand";v="99", "Google Chrome";v="133", "Chromium";v="133"',
      'sec-ch-ua-mobile': '?0',
      'sec-ch-ua-platform': '"Windows"',
      'sec-fetch-dest': 'empty',
      'sec-fetch-mode': 'cors',
      'sec-fetch-site': 'same-site'
    }
    """

  Scenario: Switch Facility
    # Get the accessToken from the login API
    * def loginToken = karate.get('loginToken')
    * header Authorization = 'Bearer ' + loginToken
    
    # Call the facility switch API
    Given path '/users/550197873257996288/facilities/1703849901/switch'
    When method PATCH
    Then status 200
    And match response.status == 'OK'
    
    # Extract the accessToken from the response headers
    # In a real scenario, you would extract it from the response
    # For this example, we'll use the Authorization header from the request
    # and extract a new token from the response if available
    
    # Check if the response contains a new token
    * def facilityToken = responseHeaders['Authorization'] ? responseHeaders['Authorization'][0].replace('Bearer ', '') : loginToken
    
    # If no token in headers, check response body (adjust based on actual API response)
    * def facilityToken = facilityToken == loginToken && response.accessToken ? response.accessToken : facilityToken
    
    # Store the token for the next API call
    * karate.set('facilityToken', facilityToken)
