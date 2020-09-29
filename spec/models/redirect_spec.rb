require 'rails_helper'

RSpec.describe Redirect, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:to) }
    it { should validate_presence_of(:from) }
  end

  context 'Associations' do
    it { should belong_to(:account) }
  end
end
