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
      expiring_in 5
    end

  end
end