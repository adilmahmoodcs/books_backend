FactoryBot.define do
    factory :book do
        author
        sequence(:title) { |n| "Best book ever (#{n})" }
        publish_year { "2022-03-19T10:44:09.252Z" }
        genre { 'Thriller' }
    end
end