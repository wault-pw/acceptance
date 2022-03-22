# frozen_string_literal: true

class Port
  attr_reader :uri

  def initialize(uri)
    @uri = uri
  end

  def has_closed?(number)
    !has_open?(number)
  end

  def has_open?(number)
    Socket.tcp(uri.host, number, connect_timeout: 2) { true }
  rescue Errno::ETIMEDOUT
    false
  end
end
