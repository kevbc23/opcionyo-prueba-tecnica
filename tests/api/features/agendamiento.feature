Feature: Agendamiento de citas

  Background:
    * url baseUrl

  @agendamiento
  Scenario: Paciente agenda sesión con especialista disponible

    Given path 'api/v1/opcionyo/specialists/123/availability'
    When method GET
    Then status 200
    And match response.availableSlots[0].available == true

    Given path 'api/v1/opcionyo/appointments'
    And request
    """
    {
      "patientId": "patient_001",
      "specialistId": "123",
      "date": "2026-07-15",
      "startTime": "10:00"
    }
    """
    When method POST
    Then status 201
    And match response.status == 'CONFIRMED'

  @agendamiento
  Scenario: Otro usuario intenta agendar el mismo slot ocupado

    Given path '/api/v1/opcionyo/appointments'
    And request
    """
    {
      "patientId": "patient_002",
      "specialistId": "123",
      "date": "2026-07-15",
      "startTime": "10:00"
    }
    """
    When method POST
    Then status 409
    And match response.error == 'SLOT_ALREADY_BOOKED'
    And match response.message == 'La cita en la hora seleccionada está ocupada. Elija otro horario'

  @agendamiento
  Scenario: Paciente cancela y el slot se libera

    #Paciente cancela la cita
    Given path '/api/v1/opcionyo/appointments/appointment_001/cancel'
    And request
    """
    {
      "reason": "Patient requested cancellation"
    }
    """
    When method PATCH
    Then status 200
    And match response.status == 'CANCELLED'

    # Validar slot liberado
    Given path '/api/v1/opcionyo/specialists/123/availability'
    When method GET
    Then status 200
    And match response.availableSlots[0].available == true
