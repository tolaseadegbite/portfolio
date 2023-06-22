class UsersController < ApplicationController
    def show
        redirect_to profile_path if params[:id].to_i == current_user.id
        @user ||= User.find(params[:id])
        @posts = @user.posts.includes(:comments, :likes).order(created_at: :desc)
        @comments = @user.comments.includes(:comments).order(created_at: :desc)
    end
end
