if @review.persisted?
  json.form render(partial: "reviews/new", formats: :html, locals: {review: Review.new})
  json.inserted_item render(partial: "reviews/render_index", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/new", formats: :html, locals: {review: @review})
end
