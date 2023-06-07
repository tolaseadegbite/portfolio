class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
        @like = current_user.likes.new(like_params)
        if @like.save
            redirect_to :back
        else
            flash[:notice] = @like.errors.full_messages.to_sentence
        end
    end

    def destroy
        @like = current_user.likes.find(params[:id])
        likeable = @like.likeable
        @like.destroy
        redirect_to :back
    end

    private

        def like_params
            params.require(:like).permit(:likeable_id, :likeable_type)
        end

        def likeable
            @likeable ||= Likeable.find(params[:likeable_id])
        end
end
