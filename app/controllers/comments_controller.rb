class CommentsController < ApplicationController
  def create
    # @comment = Comment.new(comment_params)
    # @comment.item_id = params[:item_id]
    # @comment.user_id = current_user.id

    # @comment = Comment.new(comment_params,
    #                         item_id: params[:item_id],
    #                         user_id: current_user.id)

    @item = Item.find(params[:item_id])

    @comment = @item.comments.build(comment_params.merge(user: current_user))
    # @comment.item = @item

    if @comment.save
      # render js: "alert("hi")"
      # render json: {name: '1111', age: '18'}
      # redirect_to item_path(params[:item_id]), notice: "已送出！"
    else
      render 'items/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end