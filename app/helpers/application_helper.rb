module ApplicationHelper
  def pretty_date(date)
    if date
      date.strftime("%m/%d/%Y")
    end
  end

  def pretty_date_time(date)
    if date
      date.strftime("%b %e, %l:%M %p")
    end
  end

end
