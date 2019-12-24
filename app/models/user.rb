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
    
    # has_many :following_friends, foreign_key: "follower_id", class_name: "friend"
    # has_many :followings, through: :following_friends
    # has_many :follower_friends, foreign_key: "following_id", class_name: "friend"
    # has_many :followers, through: :follower_friends
    
    # # ↓フォロー中の場合
    # def following?(other_user)
    #   following_friends.find_by(following_id: other_user.id)
    # end
    
    # # ↓これからフォローする場合
    # def follow!(other_user)
    #   following_friends.create!(following_id: other_user.id)
    # end
    
    # # ↓フォローを解除する場合
    # def unfollow!(other_user)
    #   following_friends.find_by(following_id: other_user.id).destroy
    # end
    
end
