class CartsController < ApplicationController
  def show
  end
  def destroy
    session[:carty] = nil
    redirect_to root_path, notice: "購物車已清空"
  end

  def checkout
    @order = Order.new

    gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => '7c4bcnrgsh79xvfv',
      :public_key => 'fdqscn8kxmt579gc',
      :private_key => 'aab28e9e0ed8e48f17aacabfa61850a1',
    )

    @token = gateway.client_token.generate
  end
end