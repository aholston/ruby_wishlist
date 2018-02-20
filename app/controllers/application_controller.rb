class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_val
    params.require(:user).permit(:name, :username, :password, :password_confirmation, :date_hired)
  end

  def item_val
    params.require(:item).permit(:name)
  end

  def authenticate
    if !session[:user_id]
      flash[:errors] = 'Please Log In'
      return redirect_to '/'
    end
    return

  end
end
