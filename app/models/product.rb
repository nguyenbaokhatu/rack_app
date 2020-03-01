class Product < ActiveRecord::Base
  validates_with CategoryValidator
  validates :product_name, presence: true, length: { minimum: 5 }
  validates :category_id, presence: true
  validates :discontinued, presence: true

  belongs_to :user
  belongs_to :category
end
