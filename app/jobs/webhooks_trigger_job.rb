class WebhooksTriggerJob < ApplicationJob
  queue_as :webhooks

  def perform(author_id, event_type, klass, id)
    webhook = OutgoingWebhook.find_by(author_id: author_id, event_type: event_type)
    Webhooks::TriggerWebhook.call(webhook, klass, id) if webhook.present?
  end
end
