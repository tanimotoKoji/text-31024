class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :number1, :string
    add_column :posts, :number2, :string
    add_column :posts, :number3, :string
    add_column :posts, :number4, :string
    add_column :posts, :number5, :string
  end
end
