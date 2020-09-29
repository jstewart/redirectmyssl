require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
  end

  context 'Associations' do
    it { should have_many(:redirects) }
  end
end
