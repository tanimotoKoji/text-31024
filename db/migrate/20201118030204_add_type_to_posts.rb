class AddTypeToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :type_id, :integer
  end
end
