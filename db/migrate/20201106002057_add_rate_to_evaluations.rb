class AddRateToEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_column :evaluations, :rate, :float
  end
end
