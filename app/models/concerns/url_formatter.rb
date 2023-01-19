module UrlFormatter
  extend ActiveSupport::Concern

  included do
    # Regex that webhook url must match.
    URL_REGEX = URI::DEFAULT_PARSER.make_regexp(["http", "https"])

    # Hosts that we don't want to make requests to.
    DENIED_HOSTS = %w[localhost 127.0.0.1].freeze

    validates :url, presence: true, format: {with: URL_REGEX}
    validate :url_host
    
    private
    def url_host
      return if url.blank?
      uri = URI(url) rescue nil
      if uri.blank? || DENIED_HOSTS.include?(uri.host)
        errors.add(:url, I18n.t('webhook.errors.invalid'))
      end
    end
  end
end
