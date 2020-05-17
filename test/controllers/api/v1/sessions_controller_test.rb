require 'test_helper'

class Api::V1::SessionsControllerTest < ActionDispatch::IntegrationTest
  # post login api/v1/sessions/login
  test 'пробуем войти в систему' do
    User.create(name: 'Elena', password: '12345', password_confirmation: '12345', access: 'user')
    params = { name: 'Elena', password: '12345' }
    post(api_v1_login_url, params: params)
    user = User.find_by(name: params[:name]).try(:authenticate, params[:password])
    assert_equal 'login', @controller.action_name
    assert_response 200
  end
  test 'пробуем войти с неправильными данными' do
    params = { name: 'Elena', password: '12345' }
    post(api_v1_login_url, params: params)
    user = User.find_by(name: params[:name]).try(:authenticate, params[:password])
    assert_equal 'login', @controller.action_name
    assert_response 403
  end
  # logged-in path test
  test 'пробуем сгенерировать путь по набору опций для метода logged-in контроллера sessions' do
    assert_generates(
      '/api/v1/sessions/logged-in',
      { controller: 'api/v1/sessions', action: 'logged_in' }
    )
  end
  test 'пробуем по пути определить набор параметров для метода logged-in контроллера sessions' do
    assert_recognizes(
      { controller: 'api/v1/sessions', action: 'logged_in' },
      { path: '/api/v1/sessions/logged-in', method: :get }
    )
  end
  # login path test
  test 'пробуем сгенерировать путь по набору опций для метода login контроллера sessions' do
    assert_generates(
      '/api/v1/sessions/login',
      { controller: 'api/v1/sessions', action: 'login' }
    )
  end
  test 'пробуем по пути определить набор параметров для метода login контроллера sessions' do
    assert_recognizes(
      { controller: 'api/v1/sessions', action: 'login' },
      { path: '/api/v1/sessions/login', method: :post }
    )
  end
  # logout path test
  test 'пробуем сгенерировать путь по набору опций для метода logout контроллера sessions' do
    assert_generates(
      '/api/v1/sessions/logout',
      { controller: 'api/v1/sessions', action: 'logout' }
    )
  end
  test 'пробуем по пути определить набор параметров для метода logout контроллера sessions' do
    assert_recognizes(
      { controller: 'api/v1/sessions', action: 'logout' },
      { path: '/api/v1/sessions/logout', method: :delete }
    )
  end
end
