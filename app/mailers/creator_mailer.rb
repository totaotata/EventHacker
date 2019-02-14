class CreatorMailer < ApplicationMailer


def send_mail_creator(new_attendee)

  @attendee = new_attendee.user_id
  @name_attendee = User.find(@attendee).first_name
  creator = Event.find(new_attendee.event_id)

  @name_creator = User.find(creator.user_id).first_name
  @mail_of_creator = User.find(creator.user_id).email

mail(to:@mail_of_creator,subject:" participe a votre event" )
end
end
