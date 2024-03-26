class ProfilesController < ApplicationController
    before_action :authenticate_user!, except: [:show, :profile_comments]
    before_action :correct_user, only: [:update]

    def show
        @user = User.find_by(username: params[:username])
        @posts = @user.posts.includes(:comments, :likes).order(created_at: :desc)
        @comments = @user.comments.includes(:comments).order(created_at: :desc)
    end

    def update
        @user = User.find_by(username: params[:username])
        if @user.update(profile_params)
            flash[:notice] = "Profile updated"
            redirect_to profile_path(@user.username)
        end
    end

    def profile_comments
        @user = User.find_by(username: params[:username])
        @comments = @user.comments.includes(:comments).order(created_at: :desc)
        render 'show', status: :unprocessable_entity
    end

    private

    def profile_params
        params.require(:user).permit(:username, :display_name)
    end

    # confirms the correct user
    def correct_user
        @user ||= User.find_by(username: params[:username])
        redirect_to(root_url, status: :see_other, notice: "Access denied") unless @user == current_user
    end
end
