class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    mount_uploader :icon, ImageUploader
    
    validates:name, {presence:true, length:{maximum:20}}
    validates:area, {presence:true, length:{maximum:25}}
    validates:gender, presence:true
    validates:hobby, {presence:true, length:{maximum:25}}
    validates:profile, {length:{maximum:300}}
    
    has_many :photos, :dependent => :destroy
    has_many :posts, :dependent => :destroy
    has_many :boards, :dependent => :destroy
    has_many :friends, :dependent => :destroy
    # has_many :participations, :dependent => :destroy
    
end
