# frozen_string_literal: true

require_relative 'alice_base'

class Alice < EvaBase
  class << self
    def url
      Addressable::URI.parse("https://api.wault.ru")
    end
  end
end
