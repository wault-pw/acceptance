# frozen_string_literal: true

class Webpage
  attr_reader :uri

  def initialize(uri)
    @uri = uri
  end

  def has_status?(code)
    response.status == code
  end

  def has_lang?(code)
    doc.at('html').attr('lang') == code
  end

  def has_title?
    !doc.at('title').text.strip.empty?
  end

  def has_description?
    !doc.at('meta[name=description]').attr('content').strip.empty?
  end

  def has_favicon?
    href = doc.at('link[rel=icon]').attr('href')
    Faraday.head(uri + href).success?
  end

  private

  def doc
    @doc ||= Nokogiri::HTML(response.body)
  end

  def response
    @response ||= Faraday.get(uri)
  end
end
