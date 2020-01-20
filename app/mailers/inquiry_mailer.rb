class InquiryMailer < ApplicationMailer
    
    def send_mail(inquiry)
        @inquiry = inquiry
        mail(
            from: 'viaje.por.mundo1992@i.softbank.jp',
            to: 'rome7paris10@gmail.com',
            subject: 'お問い合わせ通知'
            )
    end
    
    
end
