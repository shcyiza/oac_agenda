module AgendaHelper

  def user_date(date)
    user_date = current_user.foldates.where(:datefolwd => date)
  end

  def del_date(date)
    del_date = current_user.foldates.where(:datefolwd => date).first
  end

  def followed_date(date)
    followed_date = Foldate.where(:datefolwd => date)
  end

  def follow_in_agenda(date)
    Foldate.new(datefolwd: date, user_id: current_user.id)
  end

end
