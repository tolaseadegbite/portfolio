class UsernamesController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :redirect_to_usernames_form

    def new
        
    end

    def update
        if username_params[:username].present? && current_user.update(username_params)
            flash[:notice] = "Username successfully updated"
            redirect_to root_url
        else
            flash[:notice] = if username_params[:username].blank?
                "Please set a username"
            else
                current_user.errors.full_messages.join(", ")
            end
            render 'usernames/new', status: :unprocessable_entity
        end
    end

    private

    def username_params
        params.require(:user).permit(:username)
    end
end
