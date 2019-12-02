require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "sendmail_share" do
    mail = NoticeMailer.sendmail_share
    assert_equal "Sendmail share", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
