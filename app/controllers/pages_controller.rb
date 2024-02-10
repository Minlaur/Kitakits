class PagesController < ApplicationController
  def home
    @topic = Topic.new
  end
end
