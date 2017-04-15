class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province
  belongs_to :orderstatus
  has_many :lineItems

  scope :in_progress, ->{ where("orders.orderstatus_id = 1") }
  scope :placed, -> { where("orders.orderstatus_id = 2") }
  scope :shipped, -> { where("orders.orderstatus_id = 3") }
  scope :cancelled, -> { where("orders.orderstatus_id = 4") }
  scope :completed, -> { where("orders.orderstatus_id = 5") }
  
  def checkout!
    self.checked_out_at = Time.zone.now
    self.save
    self.lineItems.each do |item|
      bookSold = item.book
      bookSold.quantity_in_stock -= item.quantity
      bookSold.save
    end
  end

  def recalculate_price!
    self.total_price = lineItems.inject(0.0){ |sum, lineItem| sum += lineItem.price * lineItem.quantity }
    if self.orderstatus_id.nil?
      self.orderstatus_id = 1
    end
    save!
  end

  def display_name
    ActionController::Base.helpers.number_to_currency(total_price) +
        " - Order ##{id} (#{user.first_name})"
  end
end
