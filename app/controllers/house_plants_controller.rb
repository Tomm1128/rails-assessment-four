class HousePlantsController < ApplicationController
  def index
    @house_plants = HousePlant.all
  end

  def show
    @house_plant = HousePlant.find(params[:id])
    @room = @house_plant.room
  end

  def new
    @room = Room.find(params[:room_id])
    @plant = @room.house_plants.build
  end

  def create
    @room = Room.find(params[:room_id])
    @plant = @room.house_plants.build(house_plant_params)

    if @plant.save
      redirect_to @room
    else
      render :new
    end
  end

  private

  def house_plant_params
    params.require(:house_plant).permit(:plant_type, :height)
  end
end
