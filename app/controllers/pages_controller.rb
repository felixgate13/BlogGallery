class PagesController < ApplicationController
  
  skip_before_action :authorized, only: [:home, :my_story, :defrosting]

  def home
  end

  def admin

  end

  def my_story

  end

  def defrosting
  end

end
