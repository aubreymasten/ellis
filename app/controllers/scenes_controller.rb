class ScenesController < ApplicationController
  def show_add_scene
    @story = Story.find(params[:format])
    @scene = @story.scenes.new
  end
end
