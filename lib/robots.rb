# frozen_string_literal: true

class Robots
  attr_reader :uri

  def initialize(uri)
    @uri = uri
  end

  def exist?
    !content.strip.empty?
  end

  def has_content?(value)
    content[value]
  end

  private

  def content
    @content ||= connection.get(uri).body
  end

  def connection
    Faraday.new do |c|
      c.use Faraday::Response::RaiseError
    end
  end
end
