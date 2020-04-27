class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  before_create :create_order_num



  private

    def create_order_num
      self.order_num = generate_order_num
    end

    def generate_order_num
      code = [*0..9,*"A".."Z"].sample(6).join
      Date.today.to_s.split('-').join + code
    end
end
