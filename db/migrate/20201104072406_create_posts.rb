class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :pay_id
      t.integer :price
      t.references :user, null: false
      t.references :category, null: false

      t.timestamps
    end
  end
end
