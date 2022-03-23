FactoryBot.define do
    factory :author do
        sequence(:firstname) { |n| "John (#{n})" }
        sequence(:surname) { |n| "Smith (#{n})" }
        sequence(:dob) { 40.years.ago }
    end
end