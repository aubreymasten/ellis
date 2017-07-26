class ScenesController < ApplicationController
  def new
    @story = Story.find(params[:story_id])
    @scene = @story.scenes.new
  end

  def create
    @story = Story.find(params[:story_id])
    @scene =  @story.scenes.new(scene_params)
    unless @scene.save
      render partial: 'scenes/edit_error', locals: { scene: @scene }
    end
  end

  private
  def scene_params
    params.require(:scene).permit(:title, :text)
  end
end
