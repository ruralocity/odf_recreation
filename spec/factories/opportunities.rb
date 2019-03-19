FactoryBot.define do
  factory :opportunity do
    sequence(:name) { |n| "Opportunity #{n}" }
    district
    state_forest
  end
end
