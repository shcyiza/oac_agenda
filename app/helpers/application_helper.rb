module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def start_date
    params.fetch(:start_date, Date.today).to_date
  end

  def date_range
    (start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).to_a
  end

  def every_followed_dates
    Foldate.where('datefolwd > ?', Time.now).where(user: current_user).order(datefolwd: :asc)
  end

  def dates_grouped
    every_followed_dates.group_by(&:month)
  end

end
