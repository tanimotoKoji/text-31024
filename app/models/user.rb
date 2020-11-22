class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :occupation
  belongs_to_active_hash :age
  belongs_to_active_hash :gender
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :evaluations, dependent: :destroy
  has_many :posts, dependent: :destroy      
  has_one :card, dependent: :destroy
  has_many :user_rooms
  has_many :chats
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_one_attached :image

  with_options presence: true do
  validates :occupation_id, numericality: { other_than: 1, message: "--以外を選択してください"}
  validates :nickname
  validates :profile
  validates :gender_id
  validates :last_name
  validates :first_name
  validates :last_name_kana
  validates :first_name_kana
  validates :age_id, numericality: { other_than: 1, message: "--以外を選択してください"}
  end

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end