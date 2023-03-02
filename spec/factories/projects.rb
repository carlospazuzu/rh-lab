require 'ffaker'

FactoryBot.define do
  factory :project do
    name { FFaker::Lorem.word.capitalize }
    starts_on { Date.new(2023, 1, 1) }
    ends_on   { Date.new(2023, 2, 1) }

    trait :with_wrong_schedule do
      starts_on { Date.new(2023, 2, 28) }
      ends_on { Date.new(2023, 1, 1) }
    end
  end
end