Feature: Videosllamadas con AWS Chime

  Background:
    * url baseUrl

  @chime
  Scenario: Usuario se una a la reunión exitosamente

    Given path 'chime/join'
    And request
    """
    {
      "appointmentId": "APT-1001",
      "userId": "PATIENT-001",
      "simulateError": false
    }
    """

    When method post
    Then status 200
    And match response.meetingId == 'meeting-001'
    And match response.joinToken != null
    And match response.message == 'Reunión iniciada con éxito'

  @chime
  Scenario: Servicio de AWS Chime no disponible

    Given path 'chime/join'
    And request
    """
    {
      "appointmentId": "APT-1001",
      "userId": "PATIENT-001",
      "simulateError": true
    }
    """
    When method post
    Then status 503
    And match response.error == 'AWS_CHIME_UNAVAILABLE'
    And match response.message == 'El servicio de videollamadas no está disponible en este momento. Por favor, inténtelo más tarde.'