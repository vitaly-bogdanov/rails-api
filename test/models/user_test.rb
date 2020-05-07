require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'попытка создать user c соблюдением валидации' do
    user = User.new(name: 'Elena', password: '12345', password_confirmation: '12345', access: 'user')
    assert(user.save, 'user не создан')
  end
  test 'попытка создать user не указав name' do
    user = User.new(password: '12345', password_confirmation: '12345', access: 'user')
    assert_not(user.save, 'создание user прошло без указания name')
  end
  test 'попытка создать user не указав password' do
    user = User.new(name: 'Elena', password_confirmation: '12345', access: 'user')
    assert_not(user.save, 'создание user прошло без указания password')
  end
  test 'попытка создать user не указав password_confirmation' do
    user = User.new(name: 'Elena', password: '12345', access: 'user')
    assert_not(user.save, 'создание user прошло без указания password_confirmation')
  end
  test 'попытка создать два user с одинаковыми name' do
    User.create(name: 'Elena', password: '12345', password_confirmation: '12345', access: 'user')
    user = User.new(name: 'Elena', password: '12345', password_confirmation: '12345', access: 'user')
    assert_not(user.save, 'произошло создание двух user с одинаковыми name')
  end
  test 'попытка создать user без указания access' do
    user = User.new(name: 'Elena', password: '12345', password_confirmation: '12345')
    assert_not(user.save, 'произошло создание user без access')
  end
end
