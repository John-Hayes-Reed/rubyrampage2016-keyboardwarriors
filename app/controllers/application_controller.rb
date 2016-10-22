class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def set_current_user
    @user = current_user if user_signed_in?
  end
end
