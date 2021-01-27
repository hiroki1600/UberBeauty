class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id 
       redirect_to root_path
    else
       @item.destroy
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, images: []).merge(user_id: current_user.id)
  end

end
