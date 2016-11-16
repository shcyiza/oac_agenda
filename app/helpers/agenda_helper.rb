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

  def yearselect
    (Date.today.year..4.years.from_now.year).to_a
  end

  def monthselect
    (Date.today.beginning_of_year.month..Date.today.end_of_year.month).to_a
  end

  def monthsname(month)
    "01/#{month}/2016".to_date
  end



end
