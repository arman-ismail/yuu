class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  
  before_action :authenticate_user
  
  private
  
  def authenticate_user
    if (user = authenticate_token)
      @current_user = user
    else
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
  end
  
  def current_user
    @current_user
  end
  
  def authenticate_token
    authenticate_with_http_token do |token, options|
      begin
        decoded = JWT.decode(token, Rails.application.credentials.secret_key_base).first
        User.find_by(id: decoded["user_id"])
      rescue JWT::DecodeError
        nil
      end
    end
  end
  
  def authorize_admin
    unless current_user&.admin?
      render json: { error: 'Not Authorized' }, status: :forbidden
    end
  end
end