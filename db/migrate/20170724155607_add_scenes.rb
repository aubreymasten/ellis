class AddScenes < ActiveRecord::Migration[5.1]
  def change
    create_table :scenes do |t|
      t.integer :story_id
      t.string :title, default: ""
      t.string :text, default: ""

      t.timestamps
    end
  end
end
