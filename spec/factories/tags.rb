FactoryGirl.define do
  factory :tag, class: 'ExpiringTags::Tag' do

    trait :no_takeaway do
      name 'no_takeaway'
    end

    trait :not_serving do
      name 'not_serving'
    end

    trait :expiring_soon do
      name 'not_serving'
      expiring_in 5
    end

  end
end