class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :reviews

  mount_uploader :avatar, AvatarUploader

  delegate :count, to: :reviews, prefix: true

  has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy 

  has_many :following_users, through: :following_relationships, source: :followed
  has_many :followed_users, through: :followed_relationships, source: :follower

  has_many :upvotes
  
  def reviewed?(movie)
    self.reviews.exists?(movie_id: movie.id)
  end

  def follow(other_user)
    following_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    following_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following_relationships.exists?(followed_id: other_user.id)
  end

  def upvote(review)
    upvotes.create(review_id: review.id)
  end

  def self.get_random_users(curr_user)
    # User.where.not(id: id).where.not(id: following_users.pluck(:id)).sample(3)
    User.where.not(id: curr_user.id).where.not(id: curr_user.following_users.pluck(:id)).sample(3)
  end

end
