module PostsHelper

    def post_photo post
        img = post.image
        if img.representable?
            image_tag img, class: "post-photo"
        else 
            image_tag "dummy_house.png", alt: "No picture", class: "post-photo"
        end
    end

    def post_thumbnail post
        img = post.image
        if img.representable?
            image_tag img.variant(:thumb), class: "post-thumb"
        else 
            image_tag "cover_image.png", alt: "No picture", class: "post-thumb"
        end
    end

    def post_photo_url post
        img = post.image
        img.representable? ? url_for(img) : asset_url("cover_image.png")
    end

    def post_thumbnail_url post
        img = post.image
        img.representable? ? url_for(img.variant(:thumb)) : asset_url("cover_image.png")
    end
end
