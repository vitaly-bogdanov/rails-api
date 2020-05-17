require 'test_helper'

class Api::V1::PostControllerTest < ActionDispatch::IntegrationTest
  # destroy path test
  test 'пробуем сгенерировать путь по набору опций для метода destroy контроллера posts' do
    assert_generates('/api/v1/posts/1', { controller: 'api/v1/posts', action: 'destroy', id: 1 })
  end
  test 'пробуем по пути определить набор параметров для метода destroy контроллера posts' do
    assert_recognizes(
      { controller: 'api/v1/posts', action: 'destroy', id: '1' },
      { path: '/api/v1/posts/1', method: :delete }
    )
  end
  # update path test
  test 'пробуем сгенерировать путь по набору опций для метода update контроллера posts' do
    assert_generates('/api/v1/posts/1', { controller: 'api/v1/posts', action: 'update', id: '1' })
  end
  test 'пробуем по пути определить набор параметров для метода update контроллера posts' do
    assert_recognizes(
      { controller: 'api/v1/posts', action: 'update', id: '2' }, 
      { path: '/api/v1/posts/2', method: :patch }
    )
  end
  # create path test
  test 'пробуем сгенерировать путь по набору опций для метода create контроллера posts' do
    assert_generates('/api/v1/posts', { controller: 'api/v1/posts', action: 'create' })
  end
  test 'пробуем по пути определить набор параметров для метода create контроллера posts' do
    assert_recognizes(
      { controller: 'api/v1/posts', action: 'create' },
      { path: '/api/v1/posts', method: :post }
    )
  end
  # index path test
  test 'пробуем сгенерировать путь по набору опций для метода index контроллера posts' do
    # root path and api/v1/posts
    assert_generates('/', { controller: 'api/v1/posts', action: 'index' })
  end
  test 'пробуем по пути определить набор параметров для метода index контроллера posts' do
    assert_recognizes(
      { controller: 'api/v1/posts', action: 'index' },
      { path: '/api/v1/posts', method: :get }
    )
  end
end
