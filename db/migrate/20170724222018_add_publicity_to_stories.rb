class AddPublicityToStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :public, :boolean, default: false
  end
end
