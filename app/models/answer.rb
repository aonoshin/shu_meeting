class Answer < ApplicationRecord
    
    validates:answer, presence:true
    
    belongs_to :inquiry
    
end
