# frozen_string_literal: true

class EvaBase
  class << self
    # @return [Addressable::URI]
    def url
      raise NotImplementedError, __method__
    end

    # @return [String]
    def lang
      raise NotImplementedError, __method__
    end
  end
end
