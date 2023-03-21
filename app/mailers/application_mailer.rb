class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
end
class SendMailer < ApplicationMailer
  def send_email
    byebug
    @todo = params[:account]
    @host = 'https://localhost:3000' || params[:host]
    mail(
        to: @todo.email, 
        subject: 'Welcome to email' ) do |format|
      format.html { render 'send_mailer/welcome_email.html.erb' }
    end
  end
end