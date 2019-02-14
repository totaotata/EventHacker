class UserMailer < ApplicationMailer

  default from: 'no_reply@eventhacker.com'

  def welcome_email(user)
    @user=user
    @url= 'https://eventbrite-thp7.herokuapp.com/'

    mail(to:@user.email,subject: 'Bienvenue chez nous ')
  end




end
