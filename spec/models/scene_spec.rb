require 'rails_helper'

RSpec.describe Scene, type: :model do
  it { should belong_to :story }
  it { should have_many :choices }
  it { should validate_presence_of :title }
  it { should validate_presence_of :text }
end
