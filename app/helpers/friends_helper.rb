module FriendsHelper
    
    def find_friend(user_id)
        Friend.find_by(followed_id: user_id, follower_id: current_user.id)
    end
end
