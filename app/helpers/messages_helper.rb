module MessagesHelper
    
    def my_message?(message)
        if current_user.id == Friend.find_by(id: message.friend_id).follower_id
            return true
        else
            return false
        end
    end
end
