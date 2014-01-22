class SignupMailer < ActionMailer::Base
  default from: 'no-reply@colchonet.net'
  
  def confirm_email(user)
    @user = user
    @confirmation_link = root_url

    mail({
      to: user.email,
      bcc: ['sign ups <signups@colchone.net>'],
      subject: I18n.t('signup.confirm_email.subject')
    })
  end  
end  
