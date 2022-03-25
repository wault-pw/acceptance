# frozen_string_literal: true

require_relative 'eva_base'

class Eva < EvaBase
  class << self
    def url
      Addressable::URI.parse("https://cloud.wault.cn.com")
    end

    def lang
      'zh'
    end
  end
end
