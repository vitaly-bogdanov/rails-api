module ProtectRoutesConcern
  extend ActiveSupport::Concern

  included do
    before_action :session_verification, only: [:create, :update, :destroy, :logout]
  end

  def session_verification
    if session[:user_id].nil?
      render json: {}, status: 401
    end
  end
end