class CommentsController < ApplicationController
    before_action :set_alert
    before_action :authenticate_request

    def create
        comment = @alert.comments.new(comment_params.merge(user: @current_user))
        if comment.save
          render json: comment, status: :created
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end

        


  def update
    comment = @alert.comments.find(params[:id])
    if comment.update(comment_params)
      render json: comment, status: :ok
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end


  def destroy
    comment = @alert.comments.find(params[:id])
    comment.destroy
    head :no_content
  end



  private

  def set_alert
    @alert = Alert.find(params[:alert_id])
  end



  def comment_params
    params.require(:comment).permit(:content)
  end
end

