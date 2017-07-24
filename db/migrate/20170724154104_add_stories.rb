class AddStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.integer :account_id
      t.string :title, default: ""
      t.string :description, default: ""

      t.timestamps
    end
  end
end
