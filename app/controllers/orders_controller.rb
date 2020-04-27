require 'date'

class OrdersController < ApplicationController
  def index
  end

  def create
    # @order = Order.new(order_params)
    # @order.user = current_user

    @order = current_user.orders.build(order_params)

    current_cart.items.each do |cart_item|
      i = OrderItem.new(item: cart_item.item,
                        price: cart_item.item.price,
                        quantity: cart_item.quantity)
      @order.order_items << i
    end

    if @order.save
      redirect_to root_path, notice: 'ok'
    else
      redirect_to root_path, notice: 'not ok'
    end
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:receiver, :phone, :address)
  end
  def find_order
    @order = Order.find(params[:id])
  end

end
