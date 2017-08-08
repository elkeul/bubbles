class HomeController < ApplicationController
  def index
    @dives = Dive.all.order(id: :desc)
  end
end