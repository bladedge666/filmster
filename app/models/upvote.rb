class Upvote < ApplicationRecord
  belongs_to :review, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates :review_id, :user_id, presence: true
  validates :user_id, uniqueness: {scope: :review_id}
end
