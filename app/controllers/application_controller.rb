class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :check_login

  helper_method :current_user

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
end
