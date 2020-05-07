require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should ajax user create' do
    post(api_v1_create_user_url, params: { name: 'Stella', password: '12345', passwordConfirmation: '12345' }, xhr: true)
    assert_response :success
  end
end
