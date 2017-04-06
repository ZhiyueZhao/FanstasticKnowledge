class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province
  has_many :lineItems

  scope :in_progress, ->{where("orders.orderstatus_id = 1")}
  scope :complete, -> {where("orders.orderstatus_id = 5")}

  COMPLETE = "complete"
  IN_PROGRESS = "in_progress"

  def self.find_with_book(book)
    return [] unless book
    complete.joins(:lineItems).
        where(["lineItems.book_id = ?", book.id]).
        order("orders.checked_out_at DESC")
  end

  def checkout!
    self.checked_out_at = Time.now
    self.save
  end

  def recalculate_price!
    self.total_price = lineItems.inject(0.0){|sum, lineItem| sum += lineItem.price * lineItem.quantity }
    save!
  end

  def state
    orders.orderstatuses_id==1 ? IN_PROGRESS : COMPLETE
  end

  def display_name
    ActionController::Base.helpers.number_to_currency(total_price) +
        " - Order ##{id} (#{user.first_name})"
  end
end
