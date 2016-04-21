class ReviewsController < ApplicationController
  def create
    @pub = Pub.find_by(id: params[:pub_id])
    @review = Review.new(
      pub_id: params[:pub_id],
      author: params[:author],
      review_text: params[:review_text]
    )
    @review.save
    redirect_to "/pubs/#{@pub.id}"
  end

end
