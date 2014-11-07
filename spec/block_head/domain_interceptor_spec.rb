require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'block_head', 'domain_interceptor')

require 'spec_helper'

describe DomainInterceptor do
  subject(:interceptor) { DomainInterceptor }
  let(:default_recipient) { "default@gust.com" }
  let(:domain) { "gust.com" }

  describe "#delivering_email" do
    let(:message) { double(:message) }

    before do
      allow(message).to receive(:to) { destination_address }
      allow(message).to receive(:to=)
    end

    context "when the given email matches any of the domains given" do
      before do
        allow(ENV).to receive(:[]).with('VALID_EMAIL_DOMAINS') { "gust.com, gmail.com" }
      end

      let(:destination_address) { "noah@gust.com" }

      it "does not manipulate the destination of the given email" do
        interceptor.delivering_email(message)
        expect(message).to_not have_received(:to=)
      end
    end

    context "when the given email does not match any of the domains given" do
      before do
        allow(ENV).to receive(:[]).with('VALID_EMAIL_DOMAINS') { "hotmail.com" }
        allow(ENV).to receive(:[]).with('DEFAULT_EMAIL_RECIPIENT') { default_recipient }
      end

      let(:destination_address) { "noah@gmail.com" }

      it "changes the destination of the given email to the default recipient" do
        interceptor.delivering_email(message)
        expect(message).to have_received(:to=).with(default_recipient)
      end
    end
  end
end
