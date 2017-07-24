class Story < ApplicationRecord
  belongs_to :account, foreign_key: :account_id, optional: true
  has_many :scenes, dependent: :destroy
  validates :title, :description, presence: true
end
