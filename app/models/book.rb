class Book < ApplicationRecord
  belongs_to :type
  belongs_to :status
  has_many :authorBooks
  has_many :custReviews
  has_many :lineItems
end
