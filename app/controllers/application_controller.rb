class ApplicationController < ActionController::Base
  before_action :set_user

private

  def set_user
    session[:app] = 'User' # forces session to be loaded
    Current.user = User.new id: session.fetch(:session_id)
  end
end
