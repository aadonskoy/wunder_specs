FactoryGirl.define do
  factory :driver_application do
    user { create(:user) }
    sequence(:phone) { |n| "0123456789#{n}" }
    status 'pending'
    city { create(:city) }

    trait :status_accepted do
      status 'accepted'
    end

    trait :status_rejected do
      status 'rejected'
    end
  end
end

