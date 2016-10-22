class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  private

  def set_current_user
    @user = current_user if user_signed_in?
  end
end
