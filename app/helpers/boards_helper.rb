module BoardsHelper
    
    def my_board_participations
        @boards = current_user.boards
        return Participation.where(board_id: @boards)
    end
    
    # currnet_user.boards.participations
end
