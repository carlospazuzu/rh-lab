require 'ffaker'

FactoryBot.define do
  factory :assignment do
    association :employee, factory: :employee
    association :project,  factory: :project

    starts_on { Date.new(2023, 1, 1) }
    ends_on   { Date.new(2023, 2, 1) }

    trait :with_wrong_schedule do
      starts_on { Date.new(2023, 2, 1) }
      ends_on   { Date.new(2023, 1, 1) }
    end
  end
end
