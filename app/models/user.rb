class User < ApplicationRecord
  has_secure_password

  validates :name, 
    presence:   { message: 'Поле обязательно для заполнения' }, 
    uniqueness: { message: 'Пользователь с данным именем уже существует' },
    length: { 
      minimum: 5, 
      maximum: 15
    }

  validates :password, 
    presence: true,
    length: { 
      minimum: 4, 
      maximum: 8
    }

  validates :password_confirmation, presence: true
  validates :access, presence: true
end
