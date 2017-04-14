class Book < ApplicationRecord
  belongs_to :type
  belongs_to :status
  has_many :authorBooks
  has_many :custReviews
  has_many :lineItems

  validates :name, presence: true
  validates_numericality_of :quantity_in_stock, :allow_nil => false, :greater_than_or_equal_to => 1
  validates_numericality_of :pur_in_price, :allow_nil => false, :greater_than_or_equal_to => 0
  validates_numericality_of :sell_price, :allow_nil => false, :greater_than_or_equal_to => 0.1

  mount_uploader :image, ImageUploader


  scope :search_by_name, lambda {|query|where(['"books"."name" LIKE ?', "%#{query}%"])}
  scope :search_by_type, lambda {|query|where(["type_id LIKE ?", "%#{query}%"])}
  scope :search_by_status, lambda {|query|where(["status_id LIKE ?", "%#{query}%"])}
end
