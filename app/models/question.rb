class Question < ApplicationRecord
    validates:number, presence:true
    validates:qcontent, {presence:true, length:{maximum:100}}
    validates:atext, {presence:true, length:{maximum:50}}
    validates:acontent, {presence:true, length:{maximum:300}}
end
