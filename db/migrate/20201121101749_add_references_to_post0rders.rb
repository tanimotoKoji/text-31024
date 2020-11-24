class AddReferencesToPost0rders < ActiveRecord::Migration[6.0]
  def change
    add_reference :post_orders, :user
  end
end
