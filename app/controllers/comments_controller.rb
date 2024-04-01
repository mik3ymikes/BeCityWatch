class CommentsController < ApplicationController
  before_action :set_commentable, :authenticate_request

  def create
    comment = @commentable.comments.new(comment_params.merge(user: @current_user))
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def update
    comment = @commentable.comments.find(params[:id])
    if comment.update(comment_params)
      render json: comment, status: :ok
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    comment = @commentable.comments.find(params[:id])
    comment.destroy
    head :no_content
  end

  private

  def set_commentable
    if params[:alert_id]
      @commentable = Alert.find(params[:alert_id])
    elsif params[:event_id]
      @commentable = Event.find(params[:event_id])
    else
      render json: { error: 'Specify alert_id or event_id' }, status: :unprocessable_entity
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end














# class CommentsController < ApplicationController
#     before_action :set_alert
#     # before_action :set_commentable
#     before_action :authenticate_request





#     def create
#         comment = @alert.comments.new(comment_params.merge(user: @current_user))
#         if comment.save
#           render json: comment, status: :created
#         else
#           render json: comment.errors, status: :unprocessable_entity
#         end
#       end

        


#   def update
#     comment = @alert.comments.find(params[:id])
#     if comment.update(comment_params)
#       render json: comment, status: :ok
#     else
#       render json: comment.errors, status: :unprocessable_entity
#     end
#   end


#   def destroy
#     comment = @alert.comments.find(params[:id])
#     comment.destroy
#     head :no_content
#   end









#   private

#   def set_alert
#     @alert = Alert.find(params[:alert_id])
#   end

#   def set_event
#     @event = Event.find(params[:event_id])
#   end




#   def comment_params
#     params.require(:comment).permit(:content)
#   end
# end

