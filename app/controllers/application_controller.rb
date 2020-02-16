class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def admin_check_redirect
      if user_signed_in? 
        if current_user.id == 0
        else
          flash[:alert] = "権限がありません"
          redirect_to user_path(current_user.id)
        end
      else
        flash[:alert] = "権限がありません"
        redirect_to new_user_session_path
      end
  end

end
