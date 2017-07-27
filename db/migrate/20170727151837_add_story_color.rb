class AddStoryColor < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :color, :string, default: "rgb(33,33,33)"
  end
end
