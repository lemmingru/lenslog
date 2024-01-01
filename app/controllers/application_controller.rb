class ApplicationController < ActionController::Base
  include SessionsHelper
  def logged_in_user
    unless logged_in?
      store_location
      flash[:negative] = t('controllers.application.flash.please_login')
      redirect_to login_url, status: :see_other
    end
  end
end
