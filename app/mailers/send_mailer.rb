class SendMailer < ApplicationMailer
  def send_email(to_email, employee)
    byebug
    @data = employee
    @name = @data.name
    @age = @data.age
    @city = @data.city
    @state = @data.state
    @address = data.address
    mail(to: to_email, subject:"employees list" body: employee) do |format|
      format.html { render 'send_mailer/send_email' }
    end
  end
end
