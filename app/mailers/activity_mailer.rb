class ActivityMailer < ApplicationMailer
  default from: "admin@kagenda.net"

  def event_on_same_day(new_event, old_event)
    @user = old_event.orgn.user
    @new_event = new_event
    @old_event = old_event
    mail to: @user.email, subject: "Il y'a un événement qui tombe le même jours que le vôtre."
  end

  def event_on_liked_day(event, foldate)
    @user = foldate.user
    @foldate = foldate
    @event = event
    mail to: @user.email, subject: "Il y'a un événement qui tombe le même au jour que vous suivez."
  end

  def new_notifications
  end

end
