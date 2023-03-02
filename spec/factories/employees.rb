require 'ffaker'

FactoryBot.define do
  factory :employee do
    name { FFaker::Name.name }
  end
end