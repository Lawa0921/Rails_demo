class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, 
                    numericality: { only_ingeter: true, greater_than: 0 }


  scope :cheap, -> { where("price <= 50") }
  default_scope { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.now)
  end

  def favorited_by(u)
    u.items.include?(self)
  end

  has_one_attached :cover

  belongs_to :category
  has_many :comments
  has_many :favorite_items
  has_many :users, through: :favorite_items
end


# Item.available.cheap
# Item.cheap.available