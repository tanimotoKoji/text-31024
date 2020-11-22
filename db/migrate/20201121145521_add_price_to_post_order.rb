class AddPriceToPostOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :post_orders, :price, :string
  end
end
