class HomeController < ApplicationController
  def index
    @dives = Dife.all.order(id: :desc)
  end
end