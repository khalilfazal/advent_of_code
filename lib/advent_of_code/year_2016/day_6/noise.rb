require 'monkey_patches/array'

class Noise
  private_class_method :new

  class << self
    def unscramble(input)
      unscramble_generic input, :mode
    end

    def unscramble2(input)
      unscramble_generic input, :rarest
    end

    private

    def unscramble_generic(input, mode)
      input.map(&:chars).transpose.map(&mode).join
    end
  end
end