class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_auth

  def authenticate!
     redirect_to root_path unless user_signed_in?
  end

  def user_signed_in?
     !!session[:user_id]
  end

  def current_user
     User.find(session[:user_id])
  end

  def all_users
    @users = User.all
  end

  def get_current_user_location
      #@location_info = request.location
      #@locations = Event.near([@location_info.latitude, @location_info.longitude], 20)
      @locations = Event.near([52.3921183, 16.8979023], 20)
  end

  def update_ip
    current_user.update(ip_address: request.remote_ip)
    current_user.save
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def set_auth
      @auth = session[:omniauth] if session[:omniauth]
    end

    helper_method :current_user
end
