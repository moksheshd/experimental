Feature: Job Creation Load Test

  Background:
    * url 'https://api.cipla.stage.platform.leucinetech.com/v1'
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

  Scenario: Create Job
    # Use the accessToken from the facility switch API
    * def facilityToken = karate.get('facilityToken')
    * header Authorization = 'Bearer ' + facilityToken
    
    # Call the job creation API
    Given path '/jobs'
    And param validateUserRole = true
    And request
    """
    {
      "parameterValues": {
        "511122340372160512": {
          "parameter": {
            "id": "511122340372160512",
            "stageId": null,
            "taskId": null,
            "type": "RESOURCE",
            "data": {
              "input": null,
              "choices": [
                {
                  "objectId": "677f73c5ffe67707e9de7598",
                  "objectDisplayName": "Information Technology",
                  "objectExternalId": "IT",
                  "collection": "departments"
                }
              ],
              "urlPath": "/objects/partial?collection=departments",
              "collection": "departments",
              "objectTypeId": "6474a2da06c6ee12c4fbbfc4",
              "propertyFilters": null,
              "propertyValidations": [],
              "objectTypeExternalId": "departments",
              "objectTypeDisplayName": "Department"
            },
            "validations": {},
            "targetEntityType": "PROCESS",
            "label": "Department",
            "orderTree": 1,
            "autoInitialize": null,
            "verificationType": "NONE",
            "hidden": false,
            "mandatory": true,
            "autoInitialized": false
          },
          "reason": ""
        },
        "511122340372160513": {
          "parameter": {
            "id": "511122340372160513",
            "stageId": null,
            "taskId": null,
            "type": "RESOURCE",
            "data": {
              "input": null,
              "choices": [
                {
                  "objectId": "677f73ebffe67707e9de759e",
                  "objectDisplayName": "Information Technology",
                  "objectExternalId": "IT",
                  "collection": "areas"
                }
              ],
              "urlPath": "/objects/partial?collection=areas",
              "collection": "areas",
              "objectTypeId": "646e2b9e75e5a84a65d9593c",
              "propertyFilters": null,
              "propertyValidations": [],
              "objectTypeExternalId": "areas",
              "objectTypeDisplayName": "Area"
            },
            "validations": {},
            "targetEntityType": "PROCESS",
            "label": "Area",
            "orderTree": 2,
            "autoInitialize": null,
            "verificationType": "NONE",
            "hidden": false,
            "mandatory": true,
            "autoInitialized": false
          },
          "reason": ""
        },
        "511122340372160514": {
          "parameter": {
            "id": "511122340372160514",
            "stageId": null,
            "taskId": null,
            "type": "RESOURCE",
            "data": {
              "input": null,
              "choices": [
                {
                  "objectId": "6799e829ea63f701fcdce577",
                  "objectDisplayName": "AIR HANDLING UNIT",
                  "objectExternalId": "MFA-61",
                  "collection": "equipments"
                }
              ],
              "urlPath": "/objects/partial?collection=equipments",
              "collection": "equipments",
              "objectTypeId": "646e097875e5a84a65d95936",
              "propertyFilters": null,
              "propertyValidations": null,
              "objectTypeExternalId": "equipments",
              "objectTypeDisplayName": "Equipment"
            },
            "validations": {},
            "targetEntityType": "PROCESS",
            "label": "Portable Equipment",
            "orderTree": 3,
            "autoInitialize": null,
            "verificationType": "NONE",
            "hidden": false,
            "mandatory": true,
            "autoInitialized": false
          },
          "reason": ""
        },
        "511122340372160515": {
          "parameter": {
            "id": "511122340372160515",
            "stageId": null,
            "taskId": null,
            "type": "SINGLE_SELECT",
            "data": [
              {
                "id": "711397e7-655e-40cf-b738-448cf900cb32",
                "name": "Machine Setting",
                "state": "SELECTED"
              }
            ],
            "validations": {},
            "targetEntityType": "PROCESS",
            "label": "Activity",
            "orderTree": 4,
            "autoInitialize": null,
            "verificationType": "NONE",
            "hidden": false,
            "mandatory": true,
            "autoInitialized": false,
            "response": {
              "value": null,
              "reason": "",
              "state": "EXECUTED",
              "choices": {
                "711397e7-655e-40cf-b738-448cf900cb32": "SELECTED"
              },
              "medias": [],
              "parameterValueApprovalDto": null
            }
          },
          "reason": ""
        },
        "511122340372160516": {
          "parameter": {
            "id": "511122340372160516",
            "stageId": null,
            "taskId": null,
            "type": "RESOURCE",
            "data": {
              "input": null,
              "choices": [
                {
                  "objectId": "67b38021ad1ba142bfe7bf95",
                  "objectDisplayName": "5GC0115 (Telmisartan Portion)",
                  "objectExternalId": "5GC0115 (Telmisartan Portion)",
                  "collection": "batches"
                }
              ],
              "urlPath": "/objects/partial?collection=batches",
              "collection": "batches",
              "objectTypeId": "646e2c2a75e5a84a65d95942",
              "propertyFilters": null,
              "propertyValidations": [],
              "objectTypeExternalId": "batches",
              "objectTypeDisplayName": "Batch"
            },
            "validations": {},
            "targetEntityType": "PROCESS",
            "label": "Batch",
            "orderTree": 5,
            "autoInitialize": null,
            "verificationType": "NONE",
            "hidden": true,
            "mandatory": true,
            "autoInitialized": false
          },
          "reason": ""
        },
        "511122340372160517": {
          "parameter": {
            "id": "511122340372160517",
            "stageId": null,
            "taskId": null,
            "type": "RESOURCE",
            "data": {
              "input": null,
              "choices": [
                {
                  "objectId": "657986ec6f0ee40919abe164",
                  "objectDisplayName": "AMLODIPINE BESYLATE 10 mg AND TELMISARTAN 80 mg BILAYERED TABLETS",
                  "objectExternalId": "31003841",
                  "collection": "materials"
                }
              ],
              "urlPath": "/objects/partial?collection=materials",
              "collection": "materials",
              "objectTypeId": "646e2c0c75e5a84a65d9593f",
              "propertyFilters": null,
              "propertyValidations": [],
              "objectTypeExternalId": "materials",
              "objectTypeDisplayName": "Material"
            },
            "validations": {},
            "targetEntityType": "PROCESS",
            "label": "Product",
            "orderTree": 6,
            "autoInitialize": {
              "relation": {
                "id": "64d606cbbe369759d7f3ec91",
                "externalId": "materials",
                "displayName": "Material Description"
              },
              "parameterId": "511122340372160516"
            },
            "verificationType": "NONE",
            "hidden": true,
            "mandatory": true,
            "autoInitialized": true,
            "response": {
              "value": null,
              "reason": "",
              "state": "EXECUTED",
              "choices": {},
              "medias": [],
              "parameterValueApprovalDto": null
            }
          },
          "reason": ""
        }
      },
      "selectedUseCaseId": "1668749801",
      "checklistId": "511122340204388352"
    }
    """
    When method POST
    Then status 200
    And match response.status == 'OK'
