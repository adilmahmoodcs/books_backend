require "rails_helper"

RSpec.describe WebhookResponse, type: :model do

  describe "Column structure" do
    let(:column_structure) do
      %w[
        uid
        outgoing_webhook_id
        event_type
        record_klass
        record_id
        request_url
        request_body
        request_headers
        response_body
        response_code
        duration
        created_at
      ]
    end

    it "expect webhook response to match column structure" do
      expect(WebhookResponse.column_names).to eq(column_structure)
    end
  end
end
