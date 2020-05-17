class Api::V1::SessionsController < ApplicationController
  include CurrentUserConcern
  include ProtectRoutesConcern

  def login
    user = User.find_by(name: params[:name]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      render json: { user: user }, status: 200
    else
      render json: { errors: [ 'Пароль или имя пользователя неверно' ] }, status: 403
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
    posts = Rails.cache.fetch(:posts) do
      Post.all.map do |post|
        {
          id: post.id, title: post.title, 
          description: post.description, body: post.body,
          large_image: url_for(post.large_image),
          middle_image: url_for(post.middle_image),
          thumb_image: url_for(post.thumb_image)
        }
      end
    end
  end
end
