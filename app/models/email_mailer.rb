FEEDBACK_RECIPIENT = "san2821@gmail.com"
SENDER_RECIPIENT = "san2821@gmail.com"
class EmailMailer < ActionMailer::Base
  def email_with_attachment(data)  
    @headers = {content_type => 'text/html'}
    @sent_on = Time.now  
    @recipients = FEEDBACK_RECIPIENT
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
end
