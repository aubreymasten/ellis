class AddAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false, default: ""
      t.integer :user_id

      t.timestamps
    end
  end
end
