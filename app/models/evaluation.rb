class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :post

  with_options presence: true do
  validates :first_id
  validates :second_id
  validates :third_id
  validates :fourth_id
  validates :fifth_id
  validates :sixth_id
  validates :seventh_id
  validates :eighth_id
  validates :ninth_id
  validates :tenth_id
  validates :comment
  end
end
