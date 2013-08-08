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

  def owner?
    user = User.find session[:user_id]
    user.login == config.owner.login
  end

  def current_user
    if signed_in?
      User.find session[:user_id]
    else
      nil
    end
  end
end