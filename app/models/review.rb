class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates_presence_of :user, :movie, :comment, :on => :create, :message => "can't be blank..Please ==================="

end
