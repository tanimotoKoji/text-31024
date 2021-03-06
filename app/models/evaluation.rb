class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :post

  with_options presence: true do
  validates :first_id
  validates :second_id
  validates :third_id
  validates :fourth_id
  validates :fifth_id
  validates :comment
  end
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
