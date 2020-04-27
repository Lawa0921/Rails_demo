class Order < ApplicationRecord
  include AASM

  aasm column: 'state' do
    state :pending, initial: true
    state :paid, :delivered, :cancelled

    event :pay do
      transitions from: :pending, to: :paid

      after_transaction do
        puts "-" * 10
        puts "發送簡訊"
        puts "-" * 10
      end
    end

    event :deliver do
      transitions from: :paid, to: :delivered
    end

    event :cancel do
      transitions form: [:pending, :paid], to: :cancelled
    end
  end
  
  has_many :order_items
  belongs_to :user

  before_create :create_order_num

  attr_reader :nonce


  private

    def create_order_num
      self.order_num = generate_order_num
    end

    def generate_order_num
      code = [*0..9,*"A".."Z"].sample(6).join
      Date.today.to_s.split('-').join + code
    end
end
