class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :check_login

  helper_method :current_user, :current_cart

  private
  def record_not_found
    # redirect_to items_path, notice: '找不到該餐點!'
    render file: 'public/404.html',
    status: 404,
    layout: false
  end

  def check_login
    if not current_user
      redirect_to login_path
    end
  end

  def current_user
    User.find_by(id: session[:ccc9527])
  end

  def current_cart
    @_ca123 ||= Cart.from_hash(session[:carty])
  end

  def gateway 
    Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => ENV['bt_merchant_id'],
      :public_key => ENV['bt_public_key'],
      :private_key => ENV['bt_private_key'],
    )
  end
end
