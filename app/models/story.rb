class Story < ApplicationRecord
  belongs_to :account, foreign_key: :account_id, optional: true
  has_many :scenes, dependent: :destroy
  validates :title, :description, presence: true

  scope :most_recent_public, -> count {
    where("public = true").order(created_at: :desc).limit(count).find_all {|s| s.is_valid?}
  }

  after_create :add_color

  def add_color
    self.update_attribute :color, "rgb(#{rand(255)}, #{rand(255)}, #{rand(255)})"
  end

  def self.all_public
    self.where("public = true").find_all {|s| s.is_valid?}
  end

  def short_desc
    if self.description.length > 140
      self.description.slice(0,140).chomp(".").concat('...')
    else
      self.description
    end
  end

  def select_options
    self.scenes.map do |scene|
      [scene.title, scene.id]
    end
  end

  def toggle_publicity
    self.update_attribute :public, !self.public
  end

  def publicity
    if self.public
      "public"
    else
      "private"
    end
  end

  def start_scenes
    self.scenes.where('endgame = false').map do |scene|
      [scene.title, scene.id]
    end
  end

  def is_valid?
    self.start_scene_id &&
    self.scenes.any? &&
    self.scenes.any? { |s| s.endgame }
  end
end
