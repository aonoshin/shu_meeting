class AnswerMailer < ApplicationMailer

    # 回答者への自動メッセージ
    def send_when_create_admin(answer)
        @answer = answer
        mail to: "rome7paris10@gmail.com",
        subject: '回答を送りました！'
    end
    
    # 問い合わせの方へのお知らせメッセージ
    def send_when_create(answer)
        @answer = answer
        mail to: @answer.email,
        subject: '回答がありました。'
    end
end
