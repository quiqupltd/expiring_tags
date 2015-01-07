FactoryGirl.define do
  factory :tag, class: 'ExpiringTags::Tag' do

    trait :no_takeaway do
      tag 'no_takeaway'
    end

    trait :not_serving do
      tag 'not_serving'
    end

    trait :expiring_soon do
      tag 'not_serving'
      expires_in 5
    end

    trait :expired do
      tag 'not_serving'
      expires_in 30
      created_at 35.minutes.ago
    end

  end
end