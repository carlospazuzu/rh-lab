require 'ffaker'

FactoryBot.define do
  factory :employment do
    association :employee,   factory: :employee
    association :department, factory: :department
    association :position,   factory: :position

    registration { FFaker::Code.npi             }
    starts_on    { Time.zone.today              }
    salary       { 10_000                       }
    reason       { [1, 10, 20].sample           }

    trait :with_wrong_schedule do
      starts_on    { Date.new(2023, 2, 1) }
      ends_on      { Date.new(2023, 1, 1) }
    end

    trait :active do
      ends_on { nil }
    end

    trait :inactive do
      ends_on { 2.weeks.from_now.to_date }
    end
  end
end