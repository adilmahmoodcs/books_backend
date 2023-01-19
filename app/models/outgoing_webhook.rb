require "securerandom"

class OutgoingWebhook < ApplicationRecord
  include UrlFormatter
  # Available webhook events type
  ALLOWED_EVENT_TYPES = {
    "book/created": 0
  }
  
  ## Associations
  belongs_to :author
  has_many :responses, class_name: "WebhookResponse", dependent: :delete_all
  has_secure_token :secret

  ## Validations
  validates :event_type, presence: true
  validate :unique_event_type

  enum event_type: ALLOWED_EVENT_TYPES

  private
  def unique_event_type
    return if event_type.blank? || author_id.blank?
    if OutgoingWebhook.where(author_id: author_id, event_type: event_type).where.not(id: id).count.positive?
      errors.add(:event_type, I18n.t('webhook.errors.event_already_exist'))
    end
  end
end
