require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "confirm_signup" do
    @expected.subject = 'Mailer#confirm_signup'
    @expected.body    = read_fixture('confirm_signup')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_confirm_signup(@expected.date).encoded
  end

  test "anouncement" do
    @expected.subject = 'Mailer#anouncement'
    @expected.body    = read_fixture('anouncement')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_anouncement(@expected.date).encoded
  end

end
