class RemoveRateFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :rate, :float
  end
end
