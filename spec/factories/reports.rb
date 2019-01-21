FactoryBot.define do
  factory :report do
    sequence(:id) {|n| [n, Date.today]}
  end
end
