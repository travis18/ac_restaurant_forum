class CommentsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.build(comment_parameters)
    @comment.user = current_user
    @comment.save!
    redirect_to restaurant_path(@restaurant)
  end

  private

  def comment_parameters
    params.require(:comment).permit(:content)
  end
end
