class AddPlaysToStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :plays, :integer, default: 0
  end
end
