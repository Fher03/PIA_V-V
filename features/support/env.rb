require 'cucumber/rails'
require 'capybara/cucumber'

ActionController::Base.allow_rescue = false

# Configuración de DatabaseCleaner
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

# Usar truncation para pruebas con JavaScript
Cucumber::Rails::Database.javascript_strategy = :truncation

# Configuración específica para SQLite
Before do
  if ActiveRecord::Base.connection.adapter_name == "SQLite"
    DatabaseCleaner.strategy = :transaction
  end
end
# Configuración para limpiar la base de datos antes de cada escenario