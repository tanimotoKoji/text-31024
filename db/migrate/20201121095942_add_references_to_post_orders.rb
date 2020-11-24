class AddReferencesToPostOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :post_orders, :user_id
  end
end
