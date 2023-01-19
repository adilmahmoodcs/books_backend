require "rails_helper"

RSpec.describe WebhooksTriggerJob, type: :worker do
  describe "#perform" do
    let(:author) { create(:author) }
    
    context "when provided event type webhook is present" do
      it "should trigger provided event type webhook" do
        webhook = create(:outgoing_webhook, author: author)
        klass = "Book"
        id = 1
        trigger_webhook = double(:trigger_webhook)
        allow(Webhooks::TriggerWebhook).to receive(:call) { trigger_webhook }

        expect(Webhooks::TriggerWebhook).to receive(:call).with(webhook, klass, id)
        described_class.new.perform(author.id, webhook.event_type, klass, id)
      end
    end

    context "when provided event type webhook is not present" do
      it "should not trigger provided event type webhook" do
        webhook = create(:outgoing_webhook, author: author, event_type: "book/published")
        klass = "Book"
        id = 1
        trigger_webhook = double(:trigger_webhook)
        allow(Webhooks::TriggerWebhook).to receive(:call) { trigger_webhook }

        expect(Webhooks::TriggerWebhook).not_to receive(:call).with(webhook, klass, id)
        expect(trigger_webhook).not_to receive(:call)
        described_class.new.perform(author.id, "book/created", klass, id)
      end
    end
  end
end
