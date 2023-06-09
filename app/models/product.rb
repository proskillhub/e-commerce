class Product < ApplicationRecord
    belongs_to :category
    has_many :cart_items
    # scope :costs_more_than, ->(amount) { where("actual_price > ?", amount) }
    scope :costs_more_than, ->(amount) {where("actual_price > ?", amount) } 
    has_one_attached :image
    has_many :cart_items, dependent: :destroy
    has_many :likes
end
