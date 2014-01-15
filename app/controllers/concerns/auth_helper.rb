module Concerns
  module AuthHelper
    def sign_in user
      session[:user_id] = user.id
    end

    def sign_out
      session[:user_id] = nil
    end

    def signed_in?
      !session[:user_id].nil?
    end

    def authentificate_admin!
      unless current_user && current_user_owner?
        redirect_to new_session_path
      end
    end

    def authentificate_approved_user!
      #FIXME
      unless current_user && current_user.approved?
        f(:error)
        redirect_to root_path
      end
    end

    def current_user_owner?
      current_user.login == configus.owner.login && current_user.password == configus.owner.password
    end

    def current_user
      if signed_in?
        User.find session[:user_id]
      else
        nil
      end
    end
  end
end