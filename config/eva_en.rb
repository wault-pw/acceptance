# frozen_string_literal: true

require_relative 'eva_base'

class Eva < EvaBase
  class << self
    def url
      Addressable::URI.parse("https://cloud.wault.pw")
    end

    def lang
      'pw'
    end
  end
end
