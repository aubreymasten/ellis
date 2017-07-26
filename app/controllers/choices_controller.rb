class ChoicesController < ApplicationController
  def new
    @scene = Scene.find(params[:scene_id])
    @choice = @scene.choices.new
  end

  def create
    @scene = Scene.find(params[:scene_id])
    @choice = @scene.choices.new(choice_params)
    unless @choice.save
      # add choice errors partial
    end
  end

  private

  def choice_params
    params.require(:choice).permit(:text, :dest_scene_id)
  end
end
