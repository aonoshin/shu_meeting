class Photo < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    validates:title, length:{maximum:35}
    validates:image, presence:true
    validates:content, length:{maximum:300}
    validates:place, length:{maximum:20}
end
