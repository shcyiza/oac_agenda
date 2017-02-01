class UserMailer < ApplicationMailer
  default from: "admin@kagenda.net"

  def welcome_and_confirmation(user)
    @user = user
    mail to: @user.email, subject: "Bienvenue sur le ka'agenda, veuillez confirmez votre email"
  end
end
