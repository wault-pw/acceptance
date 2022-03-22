# frozen_string_literal: true

class AliceBase
  class << self
    # @return [Addressable::URI]
    def url
      raise NotImplementedError, __method__
    end
  end
end
