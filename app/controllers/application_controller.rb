class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end

    def clock_in?(attendance)
      return false if attendance.nil?
      !attendance.clock_in_at.nil?
    end
  
    def clock_out?(attendance)
      return false if attendance.nil?
      !attendance.clock_out_at.nil?
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
