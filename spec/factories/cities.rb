FactoryGirl.define do
  factory :city do
    sequence(:name) { |n| "SomeWhereCity#{n}" }
  end
end

