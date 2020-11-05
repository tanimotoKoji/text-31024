class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.integer :first_id,      null: false
      t.integer :second_id,     null: false
      t.integer :third_id,      null: false
      t.integer :fourth_id,     null: false
      t.integer :fifth_id,      null: false
      t.integer :sixth_id,      null: false
      t.integer :seventh_id,    null: false
      t.integer :eighth_id,     null: false
      t.integer :ninth_id,      null: false
      t.integer :tenth_id,      null: false
      t.text :comment

      t.references :user,       null: false ,foreign_key: true
      t.references :post,       null: false ,foreign_key: true

      t.timestamps
    end
  end
end