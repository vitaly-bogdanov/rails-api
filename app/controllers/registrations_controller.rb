class RegistrationsController < ApplicationController
  def create
    user = User.new name:     params[:user][:name],
                     password: params[:user][:password],
                     password_confirmation: params[:user][:password_confirmation],
                     access: 'user'

    if user.save
      session[:user_id] = user.id
      render json: { user: user }, status: 201
    else
      render json: { errors: user.errors }, status: 403
    end
  end
end
