class UsersController < ApplicationController
  def index
  end

  def create
    user = User.create(user_val)
    if user.valid?
      session[:user_id] = user.id
      return redirect_to '/items'
    else
      flash[:errors] = user.errors.full_messages
      return redirect_to '/users'
    end
  end
end
