class Mailer < ActionMailer::Base
  
  
  # Method	Value	Purpose
# recipients	[array] or "string"	A "string" containing the email of address of the recipient, or an [array] of "strings" “containing email addresses of multiple recipients. Will use the email’s To: header.
# sent_on	Object	A Time object which will be used to set the Date: header of the email. If not specified, then the current time and date will be used.
# subject	"string"	The subject line to be used to set the email’s Subject: header.
# from	[array] or "string"	A "string" containing the email address to appear on the From: line of the email being created, or an [array] of "strings" containing multiple email addresses in the same format as recipients.
# body	{hash}	The body method sets instance variables to be available in the view template
# attachment	{hash} or block	Enables you to add attachments to your email message.
# bcc	[array] or "string"	Blind carbon copy recipients in the same format as recipients.
# cc	[array] or "string"	Carbon copy recipients in the same format as recipients
# content_type	"string"	Set the content_type of the message. Defaults to text/plain
# headers	{hash}	A {hash} containing name/value pairs 1 to be converted into arbitrary header lines.
# mime_version	"string"	The mime version for the message. Defaults to 1.0
# charset	"string"	The charset for the body and to encode the subject. Defaults to UTF-8
# implicit_parts_order	[array]	When an email is built implicitly, this variable controls how the parts are ordered. Defaults to ["text/html", "text/enriched", "text/plain"]. Items that appear first in the [array] have higher priority in the receiving mail client and appear last in the mime encoded message.

  def signup_confirmation(gym, sent_at = Time.now)
    subject    "OzFighters  - Gym registration confirmation"
    recipients gym[:email]
    from       "OzFighters.com.au"
    sent_on    sent_at
    content_type "text/html"

    body       :gym_name => gym[:name], :gym_id => gym[:id], :trainer_name => gym[:first_name]+" "+gym[:last_name], :activation_code => gym[:activation_code]
  end

  def anouncement(title,bcc_recipients_array, sent_at = Time.now)
    subject    title
    recipients "adam@adamwitt.com.au"
    bcc         bcc_recipients_array
    from       "OzFighters.com.au"
    sent_on    sent_at
    content_type "text/html"

    body       :greeting => 'Hi,'
  end
  
  def test
    subject    "test"
    recipients ["adam@adamwitt.com.au","aussie_aaa@hotmail.com"]
    bcc         "witta02@student.uwa.edu.au"
    from       "noreply@ozfighters.com.au"
    sent_on    Time.now
    content_type "text/html"
  end

end
