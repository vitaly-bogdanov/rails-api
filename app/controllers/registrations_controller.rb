class RegistrationsController < ApplicationController
  def create
    user = User.new name:     params[:name],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation]

    if user.save
      sessions[:user_id] = user.id
      render json: { user: user }, status: 201
    else
      render json: { errors: user.errors }, status: 403
    end
  end
end
