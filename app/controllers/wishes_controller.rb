class WishesController < ApplicationController

  before_action :authenticate

  def create
    user = User.find(session[:user_id])
    item = Item.find(params[:item_id])
    Wish.create(user: user, item: item)
    redirect_to '/items'
  end

  def destroy
    user = User.find(session[:user_id])
    item = Item.find(params[:item_id])
    wish = Wish.where(user_id: user.id, item_id: item.id)
    wish.destroy_all
    redirect_to '/items'
  end
end
