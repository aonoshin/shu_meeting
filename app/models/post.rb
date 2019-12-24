class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates:title, {presence:true, length:{maximum:27}}
    validates:content, {presence:true, length:{maximum:180}}
    validates:place, {presence:true, length:{maximum:15}}
    
    belongs_to :user
end
