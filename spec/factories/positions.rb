require 'ffaker'

FactoryBot.define do
  factory :position do
    name { FFaker::Job.title }
  end
end