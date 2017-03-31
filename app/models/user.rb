class User < ApplicationRecord
  belongs_to :province
  has_many :custReviews
  has_many :orders
  has_many :custReviews
end
