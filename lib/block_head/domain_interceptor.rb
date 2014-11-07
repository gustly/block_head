class DomainInterceptor
  def initialize(domains, default_recipient)
    @domains = domains
    @default_recipient = default_recipient
  end

  def delivering_email(message)
    unless destination_has_valid_domain?(message)
      message.to = default_recipient
    end
  end

  private

  def destination_has_valid_domain?(message)
    message.to.all? do |recipient|
      recipient_domain = recipient.split("@")[1]
      domains.include?(recipient_domain)
    end
  end

  attr_reader :domains, :default_recipient
end

