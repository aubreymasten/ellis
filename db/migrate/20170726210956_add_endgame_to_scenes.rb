class AddEndgameToScenes < ActiveRecord::Migration[5.1]
  def change
    add_column :scenes, :endgame, :boolean, default: false
  end
end
