class ApplicationController < ActionController::Base
  protect_from_forgery

protected
  def current_company
    @company ||= current_user.company if current_user
  end
  helper_method :current_company
end
