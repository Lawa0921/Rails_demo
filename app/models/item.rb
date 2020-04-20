class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, 
                    numericality: { only_ingeter: true, greater_than: 0 }


  scope :cheap, -> { where("price <= 50") }
  default_scope { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.now)
  end

  has_one_attached :cover

  belongs_to :category
  has_many :comments
end


# Item.available.cheap
# Item.cheap.available