FactoryBot.define do
  factory :state_forest do
    sequence(:name) { |n| "State forest #{n}" }
  end
end
