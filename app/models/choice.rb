class Choice < ApplicationRecord
  belongs_to :scene, foreign_key: :scene_id, optional: true
  validates :text, :dest_scene_id, presence: true
end
