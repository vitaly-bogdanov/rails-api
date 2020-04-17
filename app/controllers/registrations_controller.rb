class RegistrationsController < ApplicationController
  def create
    user = User.new name:     params[:registrations][:name],
                     password: params[:registrations][:password],
                     password_confirmation: params[:registrations][:password_confirmation],
                     access: 'user'

    if user.save
      session[:user_id] = user.id
      render json: { user: user, user_id: session[:user_id] }, status: 201
    else
      render json: { errors: user.errors, user_id: session[:user_id] }, status: 403
    end
  end
end
