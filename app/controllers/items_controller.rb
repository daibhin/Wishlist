class ItemsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find_by_id(params[:user_id])
    @items = @user.items
  end

  def new
    @user = User.find(params[:user_id])
    @item = @user.items.build
  end

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(item_params)
    if @item.save
      redirect_to users_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:title)
  end
end
