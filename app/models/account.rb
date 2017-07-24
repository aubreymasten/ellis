class Account < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, optional: true
  has_many :stories, dependent: :destroy
end
