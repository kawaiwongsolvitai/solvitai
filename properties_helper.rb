module PropertiesHelper
    def property_photo property
        img = property.photo
        if img.representable?
            image_tag img, class: "property-photo"
        else 
            image_tag "dummy_house.png", alt: "No picture", class: "property-thumb"
        end
    end

    def property_thumbnail property
        img = property.photo
        if img.representable?
            image_tag img.variant(:thumb), class: "property-thumb"
        else 
            image_tag "dummy_house.png", alt: "No picture", class: "property-thumb"
        end
    end

    def property_photo_url property
        img = property.photo
        img.representable? ? url_for(img) : asset_url("dummy_house.png")
    end

    def property_thumbnail_url property
        img = property.photo
        img.representable? ? url_for(img.variant(:thumb)) : asset_url("dummy_house.png")
    end
end
