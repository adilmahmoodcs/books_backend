# frozen_string_literal: true

require "rails_helper"

RSpec.describe Webhooks::TriggerWebhook, type: :service do
  before do
    allow(Webhooks::SendPayloadToWebhookUrl).to receive(:call).and_return(true)
  end

  let(:author) { create(:author) }
  let(:webhook) { create(:outgoing_webhook, author: author) }
  let(:book) { create(:book, author: author) }
  let(:klass) { "Book" }

  describe ".call" do
    context "when record is present" do
      it "should send the payload to webhook Url" do
        record = create(:book, author: author)
        payload = Webhooks::BookSerializer.new(record, {event_type: webhook.event_type}).to_json
        signature = Sha256Hash.generate(webhook.secret, payload)
        params = {
          webhook_id: webhook.id,
          webhook_url: webhook.url,
          payload: payload,
          signature: signature,
          record_klass: klass,
          record_id: record.id,
          event_type: webhook.event_type
        }

        allow(Webhooks::SendPayloadToWebhookUrl).to receive(:call).and_return(true)
        expect(Webhooks::SendPayloadToWebhookUrl).to receive(:call).with(params).once
        described_class.call(webhook, klass, record.id)
      end
    end

    context "when record is not present" do
      it "should not send the payload to webhook Url" do
        allow(Webhooks::SendPayloadToWebhookUrl).to receive(:call).and_return(true)
        expect(Webhooks::SendPayloadToWebhookUrl).not_to receive(:call)
        expect { described_class.new(webhook, klass, 0).call }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
