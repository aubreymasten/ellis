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

  def destroy
    respond_to :js
    @scene = Scene.find(params[:scene_id])
    choice = @scene.choices.find(params[:id])
    choice.destroy
  end

  private

  def choice_params
    params.require(:choice).permit(:text, :dest_scene_id)
  end
end
