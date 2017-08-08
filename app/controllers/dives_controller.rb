class DivesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @dives = Diver.find(params[:diver_id]).dives.order(id: :desc)
  end

  def show
    @dife = Dife.find(params[:id])
  end

  def new
    @dife = Dife.new
  end

  def create
    @dife = Dife.new(dife_params.merge({diver_id: current_diver.id}))
    if @dife.save
      flash[:notice] = "Dive successfully created!"
      redirect_to "/divers/#{current_diver.id}/dives/#{@dife.id}"
    else
      render 'new'
    end
  end

  def edit
    # Need edit in order to work on update.
    @dife = Dife.find(params[:id])
  end

  def update
    @dife = Dife.find(params[:id])
    # Devise check
    # if diver_signed_in? && current_diver == @dive.diver
    if @dife.update_attributes(dife_params)
      redirect_to diver_dife_path(@dife.diver_id, @dife.id)
    else
      render 'edit'
    end
    # end
  end

  def destroy
    @dife = Dife.find(params[:id])
    if @dife.destroy
      redirect_to root_path
    end
  end

  private

  def dife_params
    params.require(:dife).permit(:dive_number, :dive_date, :location, 
      :latitude, :longitude, :time_in, :time_out, :depth, 
      :safety_stop_minutes, :pressure_in, :pressure_out, 
      :temperature_air, :temperature_water, :buddies, :comments)
  end
end

