class Api::V1::ItemsController < ApplicationController
  def favorite
    item = Item.find(params[:id])




    
    if item.favorited_by(current_user)
      # 移除最愛
      # FavoriteItem.find_by(item: item).destroy
      current_user.items.delete(item)
      render json:{status: 'removed'}
    else
      # 加入最愛
      current_user.items << item
      render json:{status: 'favorited'}
    end
  end
end
