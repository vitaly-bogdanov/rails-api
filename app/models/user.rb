class User < ApplicationRecord
  has_secure_password

  validates :name, 
    presence:   { message: 'Поле обязательно для заполнения' }, 
    uniqueness: { message: 'Пользователь с данным именем уже существует' }

  validates :password_confirmation, presence: true
  validates :access, presence: true
end
