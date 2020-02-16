class InquiryMailer < ApplicationMailer
    
    # 問い合わせた方への自動メッセージ
    def send_when_create(inquiry)
        @inquiry = inquiry
        mail to: inquiry.email,
        subject: 'お問合せありがとうございます！'
    end
    
    # 管理者への問い合わせのお知らせメッセージ
    def send_when_create_admin(inquiry)
        @inquiry = inquiry
        mail to: "rome7paris10@gmail.com",
        subject: 'お問合せがありました。'
    end
    
end
