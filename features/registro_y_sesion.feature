Feature: Registro de usuario e inicio de sesión

  Scenario: Un usuario se registra y luego inicia sesión exitosamente
    Given que estoy en la página de registro
    When completo el formulario de registro con datos válidos
    And hago clic en "Crear cuenta"
    Then debería ver un mensaje de éxito
    And debería ser redirigido a la página de inicio
    And estoy en la página de inicio de sesión
    When ingreso el email y la contraseña correctos
    And hago clic en "Iniciar sesión"
    Then debería ser redirigido a la página de productos

  Scenario: Intento de inicio de sesión con un usuario no registrado
    Given que estoy en la página de inicio de sesión
    When ingreso un email y una contraseña incorrectos
    And hago clic en "Iniciar sesión"
    Then debería ver un mensaje de error indicando que las credenciales son incorrectas
