class Movie < ApplicationRecord
  validates :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot, :language, :country, :awards, :poster, :metascore, :imdbrating, :imdbvotes, :imdbid, presence: true

  has_many :reviews

  delegate :size, to: :reviews, prefix: true # from @movie.reviews.size to @movie.reviews_size

  scope :recent, -> { order("created_at DESC").limit(20) }
end


