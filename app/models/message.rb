class Message < ApplicationRecord
    belongs_to :friend
    validates:content, presence:true
end
