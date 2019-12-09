

class ShareMailer < ApplicationMailer
  def share_mail(share)
    @share = share
    mail to: "0615yutoyoshimu@gmail.com", subject: "お問い合わせの確認メール"
  end
end