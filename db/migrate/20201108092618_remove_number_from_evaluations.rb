class RemoveNumberFromEvaluations < ActiveRecord::Migration[6.0]
  def change
    remove_column :evaluations, :sixth_id, :integer
    remove_column :evaluations, :seventh_id, :integer
    remove_column :evaluations, :eighth_id, :integer
    remove_column :evaluations, :ninth_id, :integer
    remove_column :evaluations, :tenth_id, :integer
  end
end
