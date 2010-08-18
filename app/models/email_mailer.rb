FEEDBACK_RECIPIENT = "'BuildYourCV' <san2821@gmail.com>"
SENDER_EMAIL = "'BuildYourCv' <noreplies@buildyourcv.net>"
class EmailMailer < ActionMailer::Base
  def email_with_attachment(recipient, data)  
    @headers = {content_type => 'text/html'}
    @sent_on = Time.now  
    @recipients = recipient
    @from = SENDER_EMAIL
    @bcc = FEEDBACK_RECIPIENT
    @subject = "BuildYourCV - Your CV"
    @body = "Your PDF is attached to this email"

    # attach file
    attachment "application/octet-stream" do |a|  
      a.body = data 
      a.filename = "yourcv.pdf"
    end if data.present?  
  end  

  def fk_email(from, to, subject, msg)
    @headers = {content_type => 'text/html'}
    @sent_on = Time.now  
    @recipients = to
    @from = from
    @subject = subject
    @body = msg
  end
end
