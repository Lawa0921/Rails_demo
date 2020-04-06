class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found



  private
    def record_not_found
    # redirect_to items_path, notice: '找不到該餐點!'
    render file: 'public/404.html',
    status: 404,
    layout: false
  end
end
