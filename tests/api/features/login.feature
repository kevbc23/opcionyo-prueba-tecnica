Feature: Flujo Login

  Background:
    * url baseUrl

  @registro @regresion
  Scenario: Registro con email y contraseña válidos
    Given path 'api/v1/opcionyo/register'
    And request
    """
    {
      "email": "kevinbejarano@opcionyo-test.com",
      "password": "12345678",
    }
    """
    When method POST
    Then status 201

    And match response.message == 'Usuario registrado exitosamente'
    And match response.userId == '#number'

  @login @regresion
  Scenario Outline: Login con credenciales válidas
    Given path 'api/v1/opcionyo/login'
    And request
    """
    {
      "email": "<email>",
      "password": "<password>"
    }
    """
    When method POST
    Then status 200

    And match response.message == 'Inicio de sesión exitoso'
    And match response.token == 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.fake.token'
    And match response.expiresIn == 3600

    Examples:
      | email                           | password    |
      | kevinbejarano@opcionyo-test.com | 12$34E567-8 |

  @login @regresion
  Scenario Outline: Login con credenciales inválidas
    Given path 'api/v1/opcionyo/login'
    And request
    """
    {
      "email": "<email>",
      "password": "<password>"
    }
    """
    When method POST
    Then status 401

    And match response.message == 'Correo y/o contraseña inválida'

    # Los correos deben contener el dominio @opcionyo-test.com
    # y la contraseña debe tener al menos 8 caracteres,
    # de lo contrario se considerará inválida.
    Examples:
      | email                           | password     |
      | kevinbejarano@opcionyo-test.com | 123          |
      | kevinbejarano@otrodominio.com   | 123          |
      | @gmail.com                      | 841768716541 |
      | correo-test                     | qewrdfff     |

  Scenario: Acceso a recurso protegido sin token
    Given path 'api/v1/opcionyo/protected-resource'
    When method GET
    Then status 401

    And match response.error == 'Unauthorized'
    And match response.code == 'AUTH_TOKEN_MISSING'
    And match response.message == 'El Token de Autenticación es requerido para acceder a este recurso'

