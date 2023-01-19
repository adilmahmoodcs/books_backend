class Book < ApplicationRecord
  ## Associations
  belongs_to :author

  ## Validations
  validates :title, presence: true
  validates :title, uniqueness: { scope: :author_id }
  validates :genre, presence: true
  validates :publish_year, presence: true
  
  ## Callbacks
  after_commit :trigger_webhook, on: :create, if: proc { |book|
    book.author.outgoing_webhooks.where(event_type: "book/created").count.positive? 
  }

  private
  def trigger_webhook
    WebhooksTriggerJob.perform_later(author_id, "book/created", self.class.name, id)
  end
end
