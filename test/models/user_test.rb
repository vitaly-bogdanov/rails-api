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

  test 'попытка создать user указав полю name больше символов чем позволено валидацией(15)' do
    user = User.new(name: 'Elena Nikolaevna', password: '12345', password_confirmation: '12345', access: 'user')
    assert_not(user.save, 'произошло создание user, где поле name имеет значение длинной более 15 символов (16)')
  end
  test 'попытка создать user указав полю name меньше символов чем позволено валидацией(5)' do
    user = User.new(name: 'Mike', password: '12345', password_confirmation: '12345', access: 'user')
    assert_not(user.save, 'произошло создание user, где поле name имеет значение длинной менее 5 символов (4)')
  end
  test 'попытка создать user указав полю password меньше символов чем позволено валидацией(4)' do
    user = User.new(name: 'Elena', password: '123', password_confirmation: '123', access: 'user')
    assert_not(user.save, 'произошло создание user, где поле password имеет длину 3')
  end
  test 'попытка создать user указав полю password больше символов чем позволено валидацией(8)' do
    user = User.new(name: 'Elena', password: '123456789', password_confirmation: '123456789', access: 'user')
    assert_not(user.save, 'произошло создание user, где поле password имеет длину 9 символов')
  end
  test 'попытка создать user указав полям password и password_confirmation разные значения' do
    user = User.new(name: 'Elena', password: '987654321', password_confirmation: '123456789', access: 'user')
  end
end
