class SessionsController < ApplicationController
  def create
    if User.find_by_username(user_val[:username]).try(:authenticate, user_val[:password])
      user = User.find_by_username(user_val[:username])
      session[:user_id] = user.id
      return redirect_to '/items'
    else
      flash[:errors] = 'Invalid Combination'
      return redirect_to '/users'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
