# The user of the review
# The movie of the review
# The comment of the review

# json.user @review
# json.username @user.username
# json.introduction @user.introduction
# json.avatar_url @user.avatar_url
json.reviews do
  json.array! @reviews do |review|
    json.review_user review.user.username
    json.movie review.movie
    json.comment review.comment
  end
end