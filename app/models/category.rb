class Category < ApplicationRecord

  has_many :events_categories, dependent: :destroy
  has_many :events, through: :events_categories
end
