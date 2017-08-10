class DiveTypesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @dive_types = DiveType.all
  end

  def show
    @dive_type = DiveType.find(params[:id])
  end

  def new
    @dive_type = DiveType.new
  end

  def create
    @dive_type = DiveType.new(dive_type_params)
    if @dive_type.save
      flash[:notice] = "DiveType successfully created!"
      @dive_types = DiveType.all
      render 'index'
    else
      render 'new'
    end
  end

  private

  def dive_type_params
    params.require(:dive_type).permit(:activity)
  end
end
