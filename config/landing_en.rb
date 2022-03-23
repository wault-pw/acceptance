# frozen_string_literal: true

require_relative 'landing_base'

class Landing < LandingBase
  class << self
    def url
      Addressable::URI.parse("https://www.wault.pw")
    end

    def lang
      'en'
    end
  end
end
