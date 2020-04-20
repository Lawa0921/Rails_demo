class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]
                            # except: [:index, :new, :create]

  def index
    @items = Item.all
    # @items = Item.where(deleted_at: nil)
    # @items = Item.available
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path, notice: '成功新增餐點!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    
    if @item.update(item_params)
      redirect_to items_path, notice: '成功修改餐點!'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    # @item.update(deleted_at: Time.now)
    redirect_to items_path, notice: '成功刪除餐點!'
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :spec, :category_id, :cover)
  end
  def find_item
    @item = Item.find(params[:id])
    # @item = Item.find_by!(id: params[:id], deleted_at: nil)
  end
end