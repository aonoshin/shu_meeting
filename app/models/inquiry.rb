class Inquiry < ApplicationRecord
    
    validates:name, presence:true
    validates:email, presence:true
    validates:message, {presence:true, length:{maximum:500}}
    
    has_many :answers, :dependent => :destroy
    
end
