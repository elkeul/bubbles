class DivesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @dives = Diver.find(params[:diver_id]).dives.order(dive_number: :desc)
  end

  def show
    @dive = Dive.find(params[:id])
  end

  def new
    @dive = Dive.new
  end

  def create
    @dive = Dive.new(dive_params.merge({diver_id: current_diver.id}))
    if @dive.save
      flash[:notice] = "Dive successfully created!"
      redirect_to "/divers/#{current_diver.id}/dives/#{@dive.id}"
    else
      render 'new'
    end
  end

  def edit
    # Need edit in order to work on update.
    @dive = Dive.find(params[:id])
  end

  def update
    @dive = Dive.find(params[:id])
    # Devise check
    # if diver_signed_in? && current_diver == @dive.diver
    if @dive.update_attributes(dive_params)
      redirect_to diver_dive_path(@dive.diver_id, @dive.id)
    else
      render 'edit'
    end
    # end
  end

  def destroy
    @dive = Dive.find(params[:id])
    if @dive.destroy
      redirect_to root_path
    end
  end

  private

  def dive_params
    params.require(:dive).permit(:dive_number, :dive_date, :location, 
      :latitude, :longitude, :time_in, :time_out, :depth, 
      :safety_stop_minutes, :pressure_in, :pressure_out, 
      :temperature_air, :temperature_water, :buddies, :comments)
  end
end

