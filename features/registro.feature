Feature: Registro de usuario

  Scenario: Un usuario se registra exitosamente
    Given que estoy en la página de registro
    When completo el formulario de registro con datos válidos
    And hago clic en "Crear cuenta"
    Then debería ver un mensaje de éxito
    And debería ser redirigido a la página de inicio

  Scenario: El registro falla debido a un email ya registrado
    Given que estoy en la página de registro
    When completo el formulario de registro con un email ya registrado
    And hago clic en "Crear cuenta"
    Then debería ver un mensaje de error indicando que el email ya está registrado
