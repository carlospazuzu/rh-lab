require 'ffaker'

FactoryBot.define do
  factory :department do
    name { FFaker::Name.name }
    association :manager, factory: :employee
  end
end