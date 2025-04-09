class User < ApplicationRecord
  has_secure_password  # Permite la autenticación de contraseñas

  has_many :user_sessions, dependent: :destroy  # Relación con sesiones de usuario
  # Normaliza el correo electrónico
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  # Validaciones
  validates :email_address, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :password_confirmation, presence: true, if: :password_present?

  private

  def password_present?
    password.present?
  end
end
