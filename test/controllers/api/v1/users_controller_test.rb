require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  # метод create, url: api/v1/posts
  test 'пробуем сделать запрос post' do
    post(api_v1_create_user_url, params: { name: 'Stella', password: '12345', passwordConfirmation: '12345' })
    assert_equal 'create', @controller.action_name
    assert_response 201
  end
  test 'пробуем отправить запрос post без поля name' do
    post(api_v1_create_user_url, params: { password: '12345', passwordConfirmation: '12345' })
    assert_equal 'create', @controller.action_name
    assert_response 422
  end
  test 'пробуем отправить запрос post без поля password' do
    post(api_v1_create_user_url, params: { name: 'Stella', passwordConfirmation: '12345' })
    assert_equal 'create', @controller.action_name
    assert_response 422
  end
  test 'пробуем отправить запрос post без поля passwordConfirmation' do
    post(api_v1_create_user_url, params: { name: 'Stella', password: '12345'})
    assert_equal 'create', @controller.action_name
    assert_response 422
  end
  test 'пробуем отправить запрос post с разными значениями password и passwordConfirmation' do 
    post(api_v1_create_user_url, params: { name: 'Stella', password: '54321', passwordConfirmation: '12345' })
    assert_equal 'create', @controller.action_name
    assert_response 422
  end
end
