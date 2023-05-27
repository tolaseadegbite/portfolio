class UsernamesController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :redirect_to_usernames_form

    def new
        
    end

    def update
        if username_params[:username].present? && current_user.update(username_params)
            respond_to do |format|
                format.html { redirect_to root_url, notice: "Username successfully updated." }
                # format.turbo_stream { flash.now[:notice] = "Username successfully updated." }
            end
        else
            respond_to do |format|
                format.html { redirect_to new_username_url, notice: if username_params[:username].blank? 
                                                                        "Please set a username"
                                                                    else
                                                                        current_user.errors.full_messages.join(", ")
                                                                    end
                                                                     }
            end
        end
    end

    private

    def username_params
        params.require(:user).permit(:username, :display_name, :avatar)
    end
end
