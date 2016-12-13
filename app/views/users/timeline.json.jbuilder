json.reviews do
  json.array! @reviews do |review|
    json.user review.user.username
    json.movie review.movie
    json.comment review.comment
  end
end