class DomainInterceptor
  def initialize(domains, default_recipient)
    @domains, @default_recipient = domains, default_recipient
  end

  def delivering_email(message)
    message.to = default_recipient unless destination_has_valid_domain?(message)
  end

  private

  def destination_has_valid_domain?(message)
    domain = message.to.split("@")[1]
    domains.include?(domain)
  end

  attr_reader :domains, :default_recipient
end

