class AddChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.integer :scene_id
      t.integer :dest_scene_id
      t.string :text

      t.timestamps
    end
  end
end
