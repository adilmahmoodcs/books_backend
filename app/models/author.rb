class Author < ApplicationRecord
  ## Associations
  has_many :books, dependent: :destroy
  has_many :outgoing_webhooks, dependent: :destroy

  ## Validations
  validates :firstname, presence: true
  validates :surname, presence: true
  validates :dob, presence: true
  
  ## Callbacks
  # creating the default webhooks only for testing purpose
  after_commit :create_default_webhooks, on: :create
  
  # private
  def create_default_webhooks
    return unless Rails.env.development?
    OutgoingWebhook::ALLOWED_EVENT_TYPES.each do |k, v|
      self.outgoing_webhooks.create!(
        event_type: k, 
        url: 'https://webhook.site/f71fb690-4bf7-4018-ad49-69b5f732bb0a',
        description: "#{id}: #{k} webhook"
      )
    end
  end
end
