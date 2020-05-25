class PagesController < ApplicationController
  
  skip_before_action :authorized, only: [:home, :my_story]

  def home
  end

  def admin

  end

  def my_story

  end
end
