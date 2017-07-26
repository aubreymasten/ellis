class Scene < ApplicationRecord
  belongs_to :story, foreign_key: :story_id, optional: true
  has_many :choices, dependent: :destroy
  validates :title, :text, presence: true

  def get_desc (length)
    if self.text.length <= length
      self.text
    else
      self.text.slice(0,length-1).chomp(".").concat('...')
    end
  end
end
