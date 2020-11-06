class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :pay
  belongs_to :user
  has_many :evaluations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_rich_text :content
  has_one :post_order, dependent: :destroy
end
