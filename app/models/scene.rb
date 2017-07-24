class Scene < ApplicationRecord
  belongs_to :story, foreign_key: :story_id, optional: true
  has_many :choices, dependent: :destroy
  validates :title, :text, presence: true
end
