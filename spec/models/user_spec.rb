require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) {FactoryBot.create(:user)}
  describe 'sample' do
    it {expect(1).to eq(1)}
    it {expect(user.id).to eq(1)}
  end
end
