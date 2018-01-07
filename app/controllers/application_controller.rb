class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def require_login
    unless current_user
      not_authenticated
    end
  end

  def is_project_owner
    current_user == @project.user
  end
  helper_method :is_project_owner

  def find_project
    @project = Project.find(params[:project_id])
  end
end
