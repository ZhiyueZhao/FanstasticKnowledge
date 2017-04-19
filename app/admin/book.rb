ActiveAdmin.register Book do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  menu :priority => 3
  permit_params :name, :description, :product_video, :pur_in_price, :quantity_in_stock, :sell_price, :type_id, :status_id, :image
  scope :all, :default => true

  @types = Type.all
  @names = Array.new

  if(@types.nil? && @names.count>0)
    @types.each do |type|
      @names << type.name
    end

    @names.each do |name|
      scope name do |books|
        books.joins(:type).where('types.name = ?', name)
      end
    end
  end

  preserve_default_filters!
  remove_filter :type, :authorBooks, :custReviews, :lineItems, :product_video, :description, :image, :created_at, :updated_at

  index :as => :grid do |book|
    div do
      a :href => admin_book_path(book) do
        image_tag(book.image_url(:thumb))
      end
    end
    a truncate(book.name), :href => admin_book_path(book)
  end

  # index as: :block do |book|
  #   div for: book do
  #     a :href => admin_book_path(book) do
  #       image_tag(book.image_url(:thumb))
  #     end
  #     a truncate(book.name), :href => admin_book_path(book) end
  #     br
  #     li "Quantity: "    book.quantity_in_stock end
  #     br
  #     li "Purch Price:"  book.pur_in_price end
  #     br
  #     li "Sell Price:"   number_to_currency book.sell_price end
  #   end
  # end

#
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
