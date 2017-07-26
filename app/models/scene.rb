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

  def get_choices (count)
    if self.choices.count <= count
      self.choices
    else
      self.choices.limit(count)
    end
  end

  def self.title_by_id(id)
    self.find(id).title
  end
end
