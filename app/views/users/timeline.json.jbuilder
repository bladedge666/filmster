json.reviews do
  json.array! @reviews do |review|
    json.user review.user
    json.movie review.movie
    json.comment review.comment
  end
end