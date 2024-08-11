class ContactMailer < ApplicationMailer
  default from: 'vabhishek651@gmail.com'

  def welcome_email
    mail(to: "nonuabi@gmail.com", subject: "Welcome to My Awesome Site")
  end
end
