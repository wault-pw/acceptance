# frozen_string_literal: true

class Sitemap
  attr_reader :uri

  def initialize(uri)
    @uri = uri
  end

  def has_links?
    doc.at('urlset').children.any?
  end

  private

  def doc
    @doc ||= Nokogiri::XML(connection.get(uri).body)
  end

  def connection
    Faraday.new do |c|
      c.use Faraday::Response::RaiseError
    end
  end
end
