Given('I am on the registration page') do
    visit new_user_path
end

Given('that a user exists with email {string} and password {string}') do |email, password|
    User.create(email_address: email, password: password)
end

When('I visit the login page') do
    visit new_session_path
end

When('I fill {string} in the {string} field') do |value, field|
    fill_in field, with: value
end

When('I click the {string} button') do |button|
    click_button button
end

Then('I should see {string}') do |message|
    expect(page).to have_content(message)
end
Then('I should be redirected to the dashboard') do
  expect(page).to have_current_path(root_path, ignore_query: true)
end