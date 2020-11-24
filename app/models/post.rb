class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :genre
  belongs_to_active_hash :type
  belongs_to_active_hash :pay
  belongs_to :user
  has_many :evaluations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_rich_text :content
  has_one :post_order, dependent: :destroy

  with_options presence: true do
  validates :title
  validates :content
  validates :pay_id
  validates :price,format: {with: /\A[0-9]+\z/}
  validates :user_id
  validates :category_id, numericality: { other_than: 1, message: "--以外を選択してください"}
  validates :type_id, numericality: { other_than: 1, message: "--以外を選択してください"}
  validates :genre_id, numericality: { other_than: 1, message: "--以外を選択してください"}
  validates :number1
  validates :number2
  validates :number3
  validates :number4
  validates :number5
  end

end
