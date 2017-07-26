class AddStartScene < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :start_scene_id, :integer
  end
end
