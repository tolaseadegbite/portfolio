class ApplicationController < ActionController::Base
    before_action :redirect_to_usernames_form, if: -> { user_signed_in? && current_user.username.blank? }

    protected

    def redirect_to_usernames_form
        redirect_to new_username_path
    end
end
