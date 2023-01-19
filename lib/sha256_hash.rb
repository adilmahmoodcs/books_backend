module Sha256Hash
  def self.generate(secret, data)
    digest = OpenSSL::Digest.new("sha256")
    Base64.strict_encode64(OpenSSL::HMAC.digest(digest, secret, data))
  end
end
