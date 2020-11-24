class RemoveCategoryFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :posts, :category, null: false
  end
end
