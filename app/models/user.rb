class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :occupation
  belongs_to_active_hash :age
  belongs_to_active_hash :gender
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :occupation_id, numericality: { other_than: 1 } 

  has_many :evaluations, dependent: :destroy
  has_many :posts, dependent: :destroy      
  has_one :card, dependent: :destroy
  has_many :user_rooms
  has_many :chats
  has_one_attached :image
end