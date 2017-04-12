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
  scope :placed
  scope :shipped
  scope :cancelled
  scope :completed

  index do
    column("Order", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
    column("State")                   {|order| status_tag(Orderstatus.find(order.orderstatus_id.nil? ? 1 : order.orderstatus_id).name) }
    column("Date", :checked_out_at)
    column("Customer", :user, :sortable => :user_id)
    column("Total")                   {|order| number_to_currency order.total_price }
  end

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

  action_item :complete, only: :show do
    link_to 'Complete Order', complete_admin_order_path(order), method: :put if order.orderstatus_id==2
  end

  member_action :complete, method: :put do
    order = Order.find(params[:id])
    orderstatus = Orderstatus.where("name = 'Completed'").first.id
    order.update(orderstatus_id: orderstatus)
    redirect_to admin_order_path(order)
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
