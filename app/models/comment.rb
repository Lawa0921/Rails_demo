class Comment < ApplicationRecord
  validates :content, presence: true, length: {minimum: 4}
  belongs_to :user
  belongs_to :item

  default_scope {order(id: :desc)}
end
