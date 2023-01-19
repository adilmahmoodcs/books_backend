class CreateOutgoingWebhooks < ActiveRecord::Migration[7.0]

  def change
    create_table :outgoing_webhooks do |t|
      t.references :author, null: false
      t.integer :event_type, null: false
      t.string :url, null: false
      t.text :description
      t.string :secret, limit: 50, null: false
      t.timestamps
    end
  end
end
