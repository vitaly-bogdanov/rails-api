class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User.find_by(name: params[:name]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      render json: { user: user }, status: 201
    else
      render json: {}, status: 401
    end
  end

  def logged_in
    if @current_user
      render json: { user: @current_user }, status: 200
    else
      render json: {}, status: 401
    end
  end

  def login
    reset_session
    render json: {}, status: 200
  end
end
