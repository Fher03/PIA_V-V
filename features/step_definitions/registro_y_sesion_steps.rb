Given("que estoy en la página de registro") do
  visit new_user_path
end

When("completo el formulario de registro con datos válidos") do
  fill_in 'email_address', with: 'test@example.com'
  fill_in 'password', with: 'password123'
  fill_in 'password_confirmation', with: 'password123'
end

When("completo el formulario de registro con un email ya registrado") do
  existing_user = User.create!(email_address: 'existing@example.com', password: 'password123', password_confirmation: 'password123')
  fill_in 'email_address', with: existing_user.email_address
  fill_in 'password', with: 'password123'
  fill_in 'password_confirmation', with: 'password123'
end

When("hago clic en {string}") do |button|
  click_button button
end

Then("debería ver un mensaje de éxito") do
  expect(page).to have_content('Cuenta creada exitosamente')  # Asegúrate que este mensaje sea el correcto en tu vista.
end

Then("debería ver un mensaje de error indicando que el email ya está registrado") do
  expect(page).to have_content('El email ya está registrado')  # Asegúrate que este mensaje sea el correcto en tu vista.
end

Given("que estoy en la página de inicio de sesión") do
  visit new_session_path
end

When("ingreso el email y la contraseña correctos") do
  user = User.find_by(email_address: 'test@example.com')
  if user.nil?
    user = User.create!(email_address: 'test@example.com', password: 'password123', password_confirmation: 'password123')
  end
  fill_in 'email_address', with: user.email_address
  fill_in 'password', with: 'password123'
end

Then("debería ser redirigido a la página de productos") do
  expect(page).to have_current_path(products_path)
end

Then("debería ver un mensaje de error indicando que las credenciales son incorrectas") do
  expect(page).to have_content('Credenciales incorrectas')  # Asegúrate que este mensaje sea el correcto en tu vista.
end
