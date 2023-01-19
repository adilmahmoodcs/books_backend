# frozen_string_literal: true

class Webhooks::SendPayloadToWebhookUrl
  def self.call(webhook_id:, webhook_url:, payload:, signature:, record_klass:, record_id:, event_type:)
    Timeout.timeout(4) do
      # For tracking the duration
      start = Time.now
      headers = {content_type: :json, accept: :json, api_signature: signature}
      response = HTTP.headers(headers).post(webhook_url, json: payload)
      
      WebhookResponse.create!({
        uid: (WebhookResponse.build_uid(webhook_id, event_type, record_klass, record_id)),
        outgoing_webhook_id: webhook_id,
        request_url: webhook_url,
        request_body: payload,
        request_headers: headers,
        response_body: response.body,
        response_code: response.code,
        duration: Time.now - start,
        record_klass: record_klass,
        record_id: record_id,
        event_type: event_type
      })
    end
  rescue => e
    puts e
    nil
  end
end
