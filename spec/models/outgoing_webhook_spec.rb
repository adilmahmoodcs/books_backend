require "rails_helper"

RSpec.describe OutgoingWebhook, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to have_many(:responses).class_name("WebhookResponse").dependent(:delete_all) }
  end

  describe "Column structure" do
    let(:column_structure) do
      %w[
        id
        author_id
        event_type
        url
        description
        secret
        created_at
        updated_at
      ]
    end

    it "expect outgoing_webhook to match column structure" do
      expect(OutgoingWebhook.column_names).to eq(column_structure)
    end
  end

  describe "validations" do
    let(:author) { build(:author) }

    it { should have_secure_token(:secret).ignoring_check_for_db_index }
    it { should define_enum_for(:event_type).with(OutgoingWebhook::ALLOWED_EVENT_TYPES) }
    it { is_expected.to validate_presence_of(:event_type) }
    it { is_expected.to validate_presence_of(:url) }
    it { should allow_value("http://www.google.com").for(:url) }
    it { should allow_value("https://www.google.com").for(:url) }
    it { should_not allow_value("www.google.com").for(:url) }
    it { should_not allow_value("https://localhost:3000/com").for(:url) }

    describe "#unique_event_type" do
      context "when same event_types two webhooks are present" do
        let!(:outgoing_webhook_1) { create(:outgoing_webhook, author: author) }
        let!(:outgoing_webhook_2) { build(:outgoing_webhook, author: author) }

        it "is invalid" do
          expect(outgoing_webhook_2).not_to be_valid
        end
      end

      context "when different event_types two webhooks are present" do
        let!(:outgoing_webhook_1) { create(:outgoing_webhook, author: author, event_type: "book/created") }
        let!(:outgoing_webhook_2) { build(:outgoing_webhook, author: author, event_type: "book/published") }

        it "is valid" do
          expect(outgoing_webhook_2).to be_valid
        end
      end
    end
  end
end
