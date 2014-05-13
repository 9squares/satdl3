class User < ActiveRecord::Base
  validates :username, presence: true, length: { minimum: 2 }, uniqueness: true
  has_many :goals, dependent: :destroy
  has_many :tasks, through: :goals, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
  								   class_name:  "Relationship",
  								   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :comments, dependent: :destroy
  has_many :group_memberships
  has_many :groups, through: :group_memberships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end
end
