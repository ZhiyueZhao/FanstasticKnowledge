class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province
  has_many :lineItems
end
