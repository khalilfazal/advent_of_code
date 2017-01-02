require 'monkey_patches/array'

# noises are decoded by finding the most common or least common character per column
class Noise
  private_class_method :new

  class << self
    # @param input [String]
    #
    # @return String
    def unscramble(input)
      unscramble_generic input, :mode
    end

    # @param input [String]
    #
    # @return String
    def unscramble2(input)
      unscramble_generic input, :rarest
    end

    private

    # @param input [String]
    # @param mode Symbol
    #
    # @return String
    def unscramble_generic(input, mode)
      input.map(&:chars).transpose.map(&mode).join
    end
  end
end