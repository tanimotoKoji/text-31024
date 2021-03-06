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
  validates :email, uniqueness: { case_sensitive: false}
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :occupation_id, numericality: { other_than: 1, message: "--以外を選択してください"}
  validates :nickname
  validates :profile
  validates :gender_id
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana, format: {with:/\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, format: {with:/\A[ァ-ヶー－]+\z/}
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


  def self.guest
    find_or_create_by(email: "admin@gmail.com") do |user|
    user.password = "admin111"
    end
  end
end

