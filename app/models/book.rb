class Book < ApplicationRecord
  belongs_to :type
  belongs_to :status
  has_many :authorBooks
  has_many :custReviews
  has_many :lineItems

  mount_uploader :image, ImageUploader

  scope :search_by_name, lambda {|query|where(['"books"."name" LIKE ?', "%#{query}%"])}
  scope :search_by_type, lambda {|query|where(["type_id LIKE ?", "%#{query}%"])}
  scope :search_by_status, lambda {|query|where(["status_id LIKE ?", "%#{query}%"])}
end
