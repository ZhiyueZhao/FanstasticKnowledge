ActiveAdmin.register User, :as => "Customer" do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  menu :priority => 4
  config.batch_actions = true

  permit_params :first_name, :last_name, :city, :address, :post_code, :province_id, :email

  filter :first_name_or_last_name_cont, as: :string, label: "Name"
  filter :email

  index do
    selectable_column
    id_column
    column :email
    column :city
    column :address
    column :post_code
    column :created_at
    actions
  end

  show :title => :email do
    panel "Order History" do
      table_for(customer.orders) do
        column("Order", :sortable => :id) {|order| link_to "##{order.id}", admin_order_path(order) }
        column("State")                   {|order| status_tag(Orderstatus.find(order.orderstatus_id.nil? ? 1 : order.orderstatus_id).name) }
        column("Date", :sortable => :checked_out_at){|order| pretty_format(order.checked_out_at) }
        column("Total")                   {|order| number_to_currency order.total_price }
      end
    end
  end #end show

  sidebar "Customer Details", :only => :show do
    attributes_table_for customer, :email, :first_name, :last_name, :city, :address, :post_code, :province_id, :created_at
  end

  sidebar "Completed Order History", :only => :show do
    attributes_table_for customer do
      row("Total Orders") { customer.orders.completed.count }
      row("Total Value") { number_to_currency customer.orders.completed.sum(:total_price) }
    end
  end
end
