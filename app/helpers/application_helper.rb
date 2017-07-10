module ApplicationHelper
  def pretty_date(date)
    if date
      date.strftime("%m/%d/%Y")
    end
  end
end
