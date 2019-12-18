

class ShareMailer < ApplicationMailer
  def share_mail(share)
    @share = share
    mail to: mail, subject: "お問い合わせの確認メール"
  end
end