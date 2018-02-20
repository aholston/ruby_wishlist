class ItemsController < ApplicationController
  before_action :authenticate

  def index
    @user = User.find(session[:user_id])
    @items = Item.all

  end

  def new
  end

  def create
    user = User.find(session[:user_id])
    item = Item.create(item_val)
    item.user = user 
    if item.valid?
      user.items << item
      user.wished_items << item
      return redirect_to '/items'
    else
      flash[:errors] = item.errors.full_messages
      return redirect_to '/items/new'
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to '/items'
  end

  def update
  end

  def show
    @item = Item.find(params[:id])
  end
end
