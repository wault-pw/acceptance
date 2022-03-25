# frozen_string_literal: true

require_relative 'landing_base'

class Landing < LandingBase
  class << self
    def url
      Addressable::URI.parse("https://www.wault.cn.com")
    end

    def lang
      'zh'
    end
  end
end
