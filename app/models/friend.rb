class Friend < ApplicationRecord
    
    # belongs_to :users
    has_many :messages
end
