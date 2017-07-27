class StoriesController < ApplicationController
  def index
    @stories = Story.all_public
    @most_recent = Story.most_recent_public(3)
  end

  def show
    @story = Story.find(params[:id])
    @scene = @story.scenes.find(@story.start_scene_id) if @story.start_scene_id
    # @story.update_attribute :plays, @story.plays + 1
  end

  def make_choice
    @choice = Choice.find(params[:format])
    # @story = choice.scene.story
    @next_scene = Scene.find(@choice.dest_scene_id)
  end

  def new
    @account = current_user.account
    @story = @account.stories.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      @story.update_attribute :account_id, current_user.account.id
      redirect_to account_path(current_user.account)
    else
      render :new
    end
  end

  def destroy
    story = Story.find(params[:id])
    @id = story.id
    story.destroy
    respond_to :js
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    respond_to :js
    @story = Story.find(params[:id])
    if @story.update(story_params)
      render partial: 'stories/success_edit', locals: { story: @story }
    else
      render partial: 'stories/edit_error', locals: { story: @story }
    end
  end

  def show_details
    @story = Story.find(params[:format])
    render :show_details
  end

  def hide_details
    respond_to :js
    render :hide
  end

  def show_edit
    @story = Story.find(params[:format])
  end

  def toggle_publicity
    @story = Story.find(params[:format])
    @story.toggle_publicity
    @public = current_user.account.public_stories
    @private = current_user.account.private_stories
    # respond_to :js
  end

  def set_start_scene
    @scene = Scene.find(params[:start_scene_id])
    @story = @scene.story
    @previous = Scene.find(@story.start_scene_id)
    @story.update_attribute :start_scene_id, params[:start_scene_id]
  end

  private

  def story_params
    params.require(:story).permit(:title, :description)
  end
end
