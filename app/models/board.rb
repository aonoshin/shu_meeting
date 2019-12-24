class Board < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates:title, {presence:true, length:{maximum:35}}
    validates:content, {presence:true, length:{maximum:300}}
    validates:place, {presence:true, length:{maximum:11}}
    
    belongs_to :user
end
