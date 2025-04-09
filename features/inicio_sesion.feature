Feature: Inicio de sesión de usuario

  Scenario: Un usuario inicia sesión exitosamente
    Given que estoy en la página de inicio de sesión
    When ingreso un email y una contraseña válidos
    And hago clic en "Iniciar sesión"
    Then debería ser redirigido a la página de productos

  Scenario: El inicio de sesión falla debido a credenciales incorrectas
    Given que estoy en la página de inicio de sesión
    When ingreso un email y una contraseña incorrectos
    And hago clic en "Iniciar sesión"
    Then debería ver un mensaje de error indicando que las credenciales son incorrectas
