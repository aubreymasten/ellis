require 'rails_helper'

RSpec.describe Choice, type: :model do
  it { should belong_to :scene }
  it { should validate_presence_of :text }
end
