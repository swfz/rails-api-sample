FactoryBot.define do
  factory :user do
    sequence(:id) {|n| n}
  end
end
