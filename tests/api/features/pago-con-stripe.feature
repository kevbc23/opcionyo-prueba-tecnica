Feature: Stripe Payment Success

  @stripe
  Scenario: Pago exitoso con tarjeta de prueba

    Given url stripe.baseUrlStripe
    And path '/v1/payment_intents'

    And header Authorization = 'Bearer ' + stripe.secretKey
    And header Content-Type = 'application/x-www-form-urlencoded'

    And form field amount = 2000
    And form field currency = 'usd'
    And form field payment_method = 'pm_card_visa'
    And form field confirm = true
    And form field automatic_payment_methods[enabled] = true
    And form field automatic_payment_methods[allow_redirects] = 'never'

    When method POST

    Then status 200
    And match response.status == 'succeeded'

  @stripe
  Scenario: Pago con tarjeta declinada

    Given url stripe.baseUrlStripe
    And path '/v1/payment_intents'

    And header Authorization = 'Bearer ' + stripe.secretKey
    And header Content-Type = 'application/x-www-form-urlencoded'

    And form field amount = 2000
    And form field currency = 'usd'
    And form field payment_method = 'pm_card_chargeDeclined'
    And form field confirm = true
    And form field automatic_payment_methods[enabled] = true
    And form field automatic_payment_methods[allow_redirects] = 'never'

    When method POST

    Then status 402

  @stripe
  Scenario: Stripe webhook updates subscription status


    Given url baseUrl
    And path '/webhooks/stripe'

    And request
    """
    {
      "id": "evt_test_001",
      "type": "customer.subscription.updated",
      "data": {
        "object": {
          "id": "sub_test_001",
          "status": "active"
        }
      }
    }
    """
    When method POST
    Then status 200
    And match response.received == true

    Given path 'api/v1/opcionyo/subscriptions/sub_001'
    When method GET
    Then status 200
    And match response.status == 'active'