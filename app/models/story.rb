class Story < ApplicationRecord
  belongs_to :account, foreign_key: :account_id, optional: true
  has_many :scenes, dependent: :destroy
  validates :title, :description, presence: true

  scope :most_recent_public, -> count {
    where("public = true").order(created_at: :desc).limit(count)
  }

  scope :all_public, -> {
    where("public = true")
  }

  def short_desc
    if self.description.length > 140
      self.description.slice(0,140).chomp(".").concat('...')
    else
      self.description
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
end
