module ApplicationHelper
    # include Pagy::Frontend

    def full_title(page_title="")
        base_title = "Tolase Kelvin Adegbite"
        if page_title.blank?
            base_title
        else
            "#{page_title} | #{base_title}"
        end
    end

    def nav_link_active?(link_name)
        return "btn btn-dark" if action_name == link_name
    end
end
