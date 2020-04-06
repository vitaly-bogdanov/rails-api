class SessionsController < ApplicationController
  include CurrentUserConcern

  def login
    user = User.find_by(name: params[:authorization][:name]).try(:authenticate, params[:authorization][:password])
    if user
      session[:user_id] = user.id
      render json: { user: user }, status: 200
    else
      render json: { user: {}, errors: { login: 'Пароль или имя пользователя неверно' } }, status: 401
    end
  end

  def logged_in
    if @current_user
      render json: { user: @current_user, posts: all_posts }, status: 200
    else
      render json: { posts: all_posts }, status: 401
    end
  end

  def logout
    reset_session
    render json: {}, status: 200
  end

  private

  def all_posts
    posts = []
    Post.all.each do |post|
      posts.push({
        id: post.id, title: post.title, 
        description: post.description, body: post.body,
        large_image: url_for(post.large_image),
        middle_image: url_for(post.middle_image),
        thumb_image: url_for(post.thumb_image)
      })
    end
    return posts
  end
end
