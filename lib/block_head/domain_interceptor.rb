class DomainInterceptor
  class << self
    def delivering_email(message)
      message.to = default_recipient unless destination_has_valid_domain?(message)
    end

    private

    def default_recipient
      ENV['DEFAULT_EMAIL_RECIPIENT']
    end

    def valid_domains
      if ENV['VALID_EMAIL_DOMAINS']
        ENV['VALID_EMAIL_DOMAINS'].split(",")
      else
        []
      end
    end

    def destination_has_valid_domain?(message)
      domain = message.to.split("@")[1]
      valid_domains.include?(domain)
    end
  end
end

