require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'sample' do
    before(:each) do
      FactoryBot.create_list(:report, 2)
    end

    context 'hoge' do
      it do
        expect(Report.all.size).to eq(2)
      end
    end
  end
end
