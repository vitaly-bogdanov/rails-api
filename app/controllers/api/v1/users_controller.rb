class Api::V1::UsersController < ApplicationController
  def create
    user = User.new name: params[:name],
                     password: params[:password],
                     password_confirmation: params[:passwordConfirmation],
                     access: 'user'

    if user.save
      session[:user_id] = user.id
      render json: { user: user }, status: 201
    else
      render json: { errors: user.errors }, status: 403
    end
  end
end
