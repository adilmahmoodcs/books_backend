class Webhooks::TriggerWebhook
  def initialize(webhook, klass, id)
    @webhook = webhook
    @klass = klass
    @record = klass.constantize.find(id)
  end

  def self.call(webhook, klass, id)
    new(webhook, klass, id).perform
  end

  def perform
    return if webhook_already_sent?

    Webhooks::SendPayloadToWebhookUrl.call(
      webhook_id: webhook.id,
      webhook_url: webhook.url,
      payload: payload,
      signature: signature,
      record_klass: klass,
      record_id: record.id,
      event_type: webhook.event_type
    )
  end

  private
  attr_reader :webhook, :record, :klass, :id

  def webhook_already_sent?
    WebhookResponse.exists?(
      outgoing_webhook_id: webhook.id,
      uid: WebhookResponse.build_uid(webhook.id, webhook.event_type, klass, record.id)
    )
  end

  def signature
    @signature ||= Sha256Hash.generate(webhook.secret, payload)
  end

  def payload
    @payload ||= serialized_record
  end

  def serialized_record
    "Webhooks::#{klass}Serializer".constantize.new(
      record,
      {event_type: webhook.event_type}
    ).to_json
  end
end
