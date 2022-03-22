# frozen_string_literal: true

require 'net/http'

class Cert
  extend Forwardable

  attr_reader :uri

  def_delegators :cert, :not_after

  def initialize(uri)
    @uri = uri
  end

  # @return [OpenSSL::X509::Certificate]
  def cert
    @cert ||= Net::HTTP.start(Landing.url.host, use_ssl: true).peer_cert
  end
end
