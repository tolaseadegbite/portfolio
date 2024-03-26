class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_commentable
    before_action :find_comment, only: :destroy

    def create
        @comment = @commentable.comments.new(comment_params)
        @comment.user = current_user
        flash[:notice] = "Comment successfully created"
        if @comment.save
            respond_to do |format|
                format.html { redirect_to @commentable }
                # format.turbo_stream
            end
        else
            flash[:notice] = @comment.errors.full_messages.join(", ")
            redirect_to @commentable
        end
    end

    def edit
      
    end

    def destroy
        @comment.destroy
        flash[:notice] = "Comment successfully deleted."
        redirect_to @commentable
    end

    private

    def find_comment
        @comment ||= Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:body, :parent_id)
    end

    def set_commentable
        if params[:project_id].present?
            @commentable = Project.find(params[:project_id])
        elsif params[:comment_id].present?
            @commentable = Comment.find(params[:comment_id])
        elsif params[:post_id].present?
            @commentable = Post.find(params[:post_id])
        end
    end
end