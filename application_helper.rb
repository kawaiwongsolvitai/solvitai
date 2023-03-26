module ApplicationHelper
    def profile_picture account
        img = account.photo
        if img.representable?
            image_tag img.variant(:thumb), class: "profile-pic img-circle"
        else 
            image_tag "logo.png", width: 100, alt: "No picture"
        end
    end

    def profile_cover_image account
        img = account.cover_image
        if img.representable?
            image_tag img, class: "profile-pic img-circle"
        else 
            image_tag "cover_image.png", width: 100, alt: "No picture"
        end
    end

    def profile_cover_image_url account
        img = account.cover_image
        img.representable? ? url_for(img) : asset_url("cover_image.png")
    end

    def flash_notifications
        flash_messages = []

        flash.each do |type, message|
            type = 'success' if type == 'notice'
            type = 'error' if type =='alert' || type == 'danger'
            text = "toastr['#{type}']('#{message}');"
            flash_messages << text.html_safe unless message.blank?
        end
        "<script>$(function(){ #{ flash_messages.join("\n") } });</script>".html_safe if flash_messages.any?
    end
end
