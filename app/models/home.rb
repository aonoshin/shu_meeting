class Home < ApplicationRecord
    
    mount_uploader :image, ImageUploader
    
    validates:name, length:{maximum:20}
    validates:area, length:{maximum:25}
    validates:content, length:{maximum:200}
    validates:news, length:{maximum:50}
end
