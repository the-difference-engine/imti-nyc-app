class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def about
    @title = "About Us"
  end

  def calendar
    @title = "Calendar"
  end

  def contact
    @title = "Contact"
  end

  def template
    @title = "Example Title"
  end
end
