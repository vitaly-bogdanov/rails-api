require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'попытка создать post с соблюдением правил валидации' do
    post = Post.new(title: 'New Post', description: 'New Description', body: 'New Body New Body')
    assert(post.save, 'post не создан')
  end
  test 'попытка создать post без поля title' do
    post = Post.new(description: 'New Description', body: 'New Body New Body')
    assert_not(post.save, 'post создан без поля title')
  end
  test 'попытка создать post без поля description' do
    post = Post.new(title: 'New Post', body: 'New Body New Body')
    assert_not(post.save, 'post создан без поля description')
  end
  test 'попытка создать post без поля body' do
    post = Post.new(title: 'New Post', description: 'New Description')
    assert_not(post.save, 'post создан без поля body')
  end
  test 'попытка создать post со значением поля title длинной меньше 5 символов' do
    post = Post.new(title: 'New', description: 'New Description', body: 'New Body New Body')
    assert_not(post.save, 'post создан со значением title длинною 3 символа')
  end
  test 'попытка создать post со значением поля title длинною больше 15 символов' do
    post = Post.new(title: 'New Post Hello World', description: 'New Description', body: 'New Body New Body')
    assert_not(post.save, 'post создан со значением title длинною 20 символов')
  end
  test 'попытка создать post со значением поля description длинною меньше 5 символов' do
    post = Post.new(title: 'New Post', description: 'New', body: 'New Body New Body')
    assert_not(post.save, 'post создан со значением description длинною 3 символов')
  end
  test 'попытка создать post со значением поля description длинною больше 100 символов' do
    description = 'TestTestTest testtesttest TestTestTest tesTtesTtesT TesTTesTTesT TestTestTest testtesttest TestTestTest tesTtesTtesT TesTTesTTesT'
    post = Post.new(title: 'New Post', description: 'New', body: 'New Body New Body')
    assert_not(post.save, 'post создан со значением description длинною 129 символов')
  end
  test 'попытка создать post со значением поля body меньше 5 символов' do
    post = Post.new(title: 'New Post', description: 'New Description', body: 'New')
    assert_not(post.save, 'post создан со значением body длинною 3 символов')
  end
  test 'попытка созлать post со значением поля body больше 150 символов' do
    body = 'testtesttest TestTestTest tesTtesTtesT TesTTesTTesT TesTTesTTesT TesTTesTTesT TesTTesTTesT TesTTesTTesT TesTTesTTesT TesTTesTTesT TesTTesTTesT TesTTesTTesT'
    post = Post.new(title: 'New Post', description: 'New Description', body: body)
    assert_not(post.save, 'post создан со значением body длинною 155')
  end
end
