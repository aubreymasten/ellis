class StoriesController < ApplicationController
  def index
    @stories = Story.all_public
    @most_recent = Story.most_recent_public(3)
  end

  def show
    @story = Story.find(params[:id])
    # @story.update_attribute :plays, @story.plays + 1
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

  private

  def story_params
    params.require(:story).permit(:title, :description)
  end
end
