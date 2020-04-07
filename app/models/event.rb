class Event < ApplicationRecord
  has_many :histories
  has_many :user, through: :histories
end
