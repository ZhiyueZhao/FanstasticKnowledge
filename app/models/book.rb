class Book < ApplicationRecord
  belongs_to :type
  belongs_to :status
  has_many :authorBooks
  has_many :custReviews
  has_many :lineItems

  validates :name, presence: true
  validates :quantity_in_stock, numericality: { only_integer: true, greater_than_or_equal_to: 0}, :allow_nil => false
  validates :pur_in_price, numericality: {greater_than_or_equal_to: 0.1}, :allow_nil => false
  validates :sell_price, numericality: {greater_than_or_equal_to: 0.1}, :allow_nil => false

  mount_uploader :image, ImageUploader


  scope :search_by_name, lambda {|query|where(['"books"."name" LIKE ?', "%#{query}%"])}
  scope :search_by_type, lambda {|query|where(['type LIKE ?', "%#{query}%"])}
  scope :search_by_status, lambda {|query|where(['status LIKE ?', "%#{query}%"])}
end
