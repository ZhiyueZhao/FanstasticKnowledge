ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :to_city, :to_address, :to_post_code, :shipping_fee, :user_id, :province_id, :orderstatus_id

menu :priority => 2


  filter :total_price
  filter :checked_out_at

  scope :all, :default => true
  scope :in_progress
  scope :complete

  show do
    panel "Invoice" do
      table_for(order.lineItems) do |t|
        t.column("Book") {|item| auto_link item.book}
        t.column("Quantity") {|item| item.quantity }
        t.column("Price")   {|item| number_to_currency item.price }
        tr :class => "odd" do
          td "Total:", :style => "text-align: right;"
          td
          td number_to_currency(order.total_price)
        end
      end
    end
  end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
