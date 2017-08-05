class DiversController < ApplicationController
  before_action :authenticate_diver!, except: [:index]

  def index
    @divers = Diver.all
  end

  def show
    @diver = Diver.find(params[:id])
  end

  private

  # def diver_params
  #   params.require(:diver).permit(:divername, :first_name, :last_name, :email, :password)
  # end
end