module UsersHelper
    
    def friend_check(user_id)
        
        friend_flag = nil
        
        # 現在のログインユーザーが友達リクエストをしてない、且つ友達申請が来てない状況
        if !Friend.find_by(follower_id: current_user.id, followed_id: user_id)
            if !Friend.find_by(follower_id: user_id, followed_id: current_user.id)
                friend_flag = "other"
            end
        end
        # 現在のログインユーザーが友達リクエストをしてない、且つ友達申請が来ている状況
        if Friend.find_by(follower_id: user_id, followed_id: current_user.id) &&
             !Friend.find_by(follower_id: current_user.id, followed_id: user_id)
                friend_flag = "offer"
        end   
        # 現在のログインユーザーが友達リクエストをしている、且つ友達申請が来てない状況
        if Friend.find_by(follower_id: current_user.id, followed_id: user_id)
            if !Friend.find_by(follower_id: user_id, followed_id: current_user.id)
                friend_flag = "request"
            end
        end
        # 現在のログインユーザーが友達リクエストをしている、且つ友達申請が来ている状況（つまり既に友達関係）
        if Friend.find_by(follower_id: current_user.id, followed_id: user_id)
            if Friend.find_by(follower_id: user_id, followed_id: current_user.id)
                friend_flag = "friend"
            end
        end
        
        return friend_flag
        
    end
    
end
