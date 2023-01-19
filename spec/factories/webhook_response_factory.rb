FactoryBot.define do
  factory :webhook_response, class: WebhookResponse do
    outgoing_webhook
    event_type { "book/created" }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
