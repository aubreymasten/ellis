class Story < ApplicationRecord
  belongs_to :account, foreign_key: :account_id, optional: true
  has_many :scenes, dependent: :destroy
  validates :title, :description, presence: true

  scope :most_recent, -> count {
    order(created_at: :desc).limit(count)
  }

  def short_desc
    if self.description.length > 140
      self.description.slice(0,140).chomp(".").concat('...')
    else
      self.description
    end
  end
end
