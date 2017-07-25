class Account < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, optional: true
  has_many :stories, dependent: :destroy

  def public_stories
    self.stories.where("public = true")
  end

  def private_stories
    self.stories.where("public = false")
  end
end
