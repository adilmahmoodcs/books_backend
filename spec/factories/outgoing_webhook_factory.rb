FactoryBot.define do
  factory :outgoing_webhook, class: OutgoingWebhook do
    author
    event_type { "book/created" }
    url { Faker::Internet.url }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
