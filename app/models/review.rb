class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :upvotes

  validates_presence_of :user, :movie, :comment

  delegate :username, to: :user, prefix: true
  delegate :imdbid, to: :movie, prefix: true

  scope :recent, -> { order("created_at DESC").limit(5) }
end
