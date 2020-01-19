class News < ApplicationRecord
    validates:content, {presence:true, length:{maximum:50}}
end
