class Voice < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates:name, {presence:true, length:{maximum:35}}
    validates:age, presence:true
    validates:area, {presence:true, length:{maximum:11}}
    validates:content, {presence:true, length:{maximum:200}}
    # enum status:{nonreleased: 0, released: 1}
end
