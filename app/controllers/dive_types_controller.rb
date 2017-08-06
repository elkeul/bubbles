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
    # @dive_type = DiveType.new(dive_type_params.merge({user_id: current_user.id}))
    if @dive_type.save
      flash[:notice] = "DiveType successfully created!"
      @dive_types = DiveType.all
      render 'index'
      # redirect_to "/users/#{current_user.id}/dive_types/#{@dive_type.id}"
    else
      render 'new'
    end
  end

  private

  def dive_type_params
    params.require(:dive_type).permit(:activity)
  end
end

  # def edit
  #   # Need edit in order to work on update.
  #   @dive_type = DiveType.find(params[:id])
  # end

  # def update
  #   @dive_type = DiveType.find(params[:id])
  #   # Devise check
  #   # if user_signed_in? && current_user == @dive_type.user
  #   if @dive_type.update_attributes(dive_type_params)
  #     redirect_to user_dive_type_path(@dive_type.user_id, @dive_type.id)
  #   else
  #     render 'edit'
  #   end
  #   # end
  # end

  # def destroy
  #   @dive_type = DiveType.find(params[:id])
  #   if @dive_type.destroy
  #     redirect_to root_path
  #   end
  # end
