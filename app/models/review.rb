class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates_presence_of :user, :movie, :comment

  delegate :username, to: :user, prefix: true
end
