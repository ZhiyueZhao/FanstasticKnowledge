class Author < ApplicationRecord
  has_many :authorBooks

  def full_name
    first_name + " " + last_name
  end
end
