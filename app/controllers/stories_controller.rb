class StoriesController < ApplicationController
  def index
    @stories = Story.all
    @most_recent = Story.most_recent(3)
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

  def show_details
    @story = Story.find(params[:format])
    render :show_details
  end

  def hide_details
    respond_to :js
    render :hide
  end

  private

  def story_params
    params.require(:story).permit(:title, :description)
  end
end
