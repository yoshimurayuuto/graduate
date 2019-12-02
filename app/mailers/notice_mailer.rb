class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_share.subject
  #
  default from: "yutoyoshimu@gmail.com"
  def sendmail_share(share)
    @share = share
    mail to: "0615yutoyoshimu@gmail.com", subject: "shareup"
  end
end
