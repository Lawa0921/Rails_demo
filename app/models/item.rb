class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, 
                    numericality: { only_ingeter: true, greater_than: 0 }
end
