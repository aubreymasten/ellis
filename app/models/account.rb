class Account < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, optional: true
  has_many :stories, dependent: :destroy

  def public_stories
    self.stories.where("public = true").find_all{ |s| s.is_valid? }
  end

  def private_stories
    self.stories.where("public = false").find_all{ |s| s.is_valid? }
  end

  def invalid_stories
    self.stories.find_all{ |s| !s.is_valid? }
  end
end
