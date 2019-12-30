class ApplicationController < ActionController::Base

  private
    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def is_currect_user?(user)
      current_user == user
    end
    helper_method :is_currect_user?

    def admin_user?
      current_user && current_user.admin?
    end
    helper_method :admin_user?

    def require_signin
      unless current_user
        session[:desired_url] = request.url
        flash[:error] = "Please signin first!"
        redirect_to new_session_path
      end
    end
end
