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

  has_many :evaluations
  has_many :posts       
  has_one_attached :image
end