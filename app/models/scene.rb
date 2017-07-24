class Scene < ApplicationRecord
  belongs_to :story, foreign_key: :story_id, optional: true
  validates :title, :text, presence: true
end
