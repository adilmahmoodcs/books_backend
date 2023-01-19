class CreateWebhookResponses < ActiveRecord::Migration[7.0]
  include PartitionedMigrationHelper

  def change
    create_reversible_hash_partition :webhook_responses, shard_count: 10, partition_key: :outgoing_webhook_id, primary_key: [:outgoing_webhook_id, :uid] do |t|
      t.string :uid, null: false
      t.references :outgoing_webhook, null: false
      t.integer :event_type, null: false
      t.string :record_klass
      t.string :record_id
      t.string :request_url, null: false
      t.jsonb :request_body, null: false, default: {}
      t.jsonb :request_headers, null: false, default: {}
      t.jsonb :response_body, null: false, default: {}
      t.integer :response_code
      t.integer :duration
      t.datetime :created_at, null: false
    end
  end
end
