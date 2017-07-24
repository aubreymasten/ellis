class Story < ApplicationRecord
  belongs_to :account, foreign_key: :account_id, optional: true
  validates :title, :description, presence: true
end
