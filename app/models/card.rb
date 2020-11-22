class Card < ApplicationRecord
  belongs_to :user, optional: true
  with_options presence: true do
  validates :card_token
  end
end
