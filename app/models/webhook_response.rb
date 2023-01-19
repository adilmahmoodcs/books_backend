class WebhookResponse < ApplicationRecord
  self.primary_keys = :outgoing_webhook_id, :uid
 
  ## Associations
  belongs_to :outgoing_webhook

  enum event_type: OutgoingWebhook::ALLOWED_EVENT_TYPES

  def self.build_uid(webhook_id, event_type, record_klass, record_id)
    "#{webhook_id}-#{event_type}-#{record_klass}-#{record_id}"
  end
end
